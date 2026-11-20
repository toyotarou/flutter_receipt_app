import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../collections/saved_receipt.dart';
import '../models/receipt.dart';

/// main.dart で Isar.open したものを overrideWithValue で渡す
final Provider<Isar> isarProvider = Provider<Isar>(
  (Ref ref) => throw UnimplementedError('isarProvider は main.dart で override してください'),
);

final Provider<ReceiptsRepository> receiptsRepositoryProvider = Provider<ReceiptsRepository>(
  (Ref ref) => ReceiptsRepository(isar: ref.watch(isarProvider)),
);

/// 保存済みのレシート一覧。保存・削除すると自動で新しい一覧が流れてくる（ホームのタブ・カレンダー用）
final StreamProvider<List<SavedReceipt>> savedReceiptListProvider = StreamProvider<List<SavedReceipt>>(
  (Ref ref) => ref.watch(receiptsRepositoryProvider).watchReceiptList(),
);

class ReceiptsRepository {
  ReceiptsRepository({required this.isar});

  final Isar isar;

  ///
  IsarCollection<SavedReceipt> getReceiptCollection() => isar.savedReceipts;

  ///
  IsarCollection<SavedReceiptItem> getItemCollection() => isar.savedReceiptItems;

  /// 読み取ったレシートを、レシート1件＋品目を1トランザクションで保存する。保存したレシートの id を返す
  Future<int> saveReceipt({required Receipt receipt}) async {
    final SavedReceipt savedReceipt = SavedReceipt()
      ..store = receipt.storeName
      ..date = receipt.date
      ..time = receipt.time
      ..payMethod = receipt.paymentMethod
      ..sum = receipt.subtotal
      ..tax = receipt.tax
      ..discount = receipt.discount
      ..total = receipt.total
      ..itemCount = receipt.itemCount
      ..needsCheck = receipt.needsCheck
      ..createdAt = DateTime.now();

    return isar.writeTxn(() async {
      final Id receiptId = await getReceiptCollection().put(savedReceipt);

      // 品目は読み取った順に登録する（id の昇順＝レシートの並び順になる）
      final List<SavedReceiptItem> itemList = <SavedReceiptItem>[
        for (final ReceiptItem item in receipt.items)
          SavedReceiptItem()
            ..receiptId = receiptId
            ..item = item.name
            ..quantity = item.quantity
            ..unitPrice = item.unitPrice
            ..price = item.price
            ..taxRate = item.taxRate,
      ];
      await getItemCollection().putAll(itemList);

      return receiptId;
    });
  }

  /// レシート1枚を削除する（そのレシートの品目もまとめて消す）
  Future<void> deleteReceipt({required int receiptId}) async {
    await isar.writeTxn(() async {
      await getItemCollection().where().receiptIdEqualTo(receiptId).deleteAll();
      await getReceiptCollection().delete(receiptId);
    });
  }

  /// 保存済みのレシートの件数
  Future<int> countReceipts() async => getReceiptCollection().count();

  /// 保存済みのレシート一覧（日付・時刻の古い順。リストのアラート用）
  Future<List<SavedReceipt>> getReceiptList() async =>
      getReceiptCollection().where().sortByDate().thenByTime().findAll();

  /// 1日分のレシート一覧（時刻の古い順。カレンダーの日付から開くリスト用）
  Future<List<SavedReceipt>> getReceiptListByDate({required String date}) async =>
      getReceiptCollection().where().dateEqualTo(date).sortByTime().findAll();

  /// 保存済みのレシート一覧を見張る（最初に今の一覧を流し、そのあとは変わるたびに流す）
  Stream<List<SavedReceipt>> watchReceiptList() =>
      getReceiptCollection().where().sortByDateDesc().thenByTimeDesc().watch(fireImmediately: true);

  /// 1枚のレシートの品目（レシートの並び順）
  /// receiptId のインデックスで引くと、同じ receiptId の中は id の昇順で返る（＝読み取った順）ので、並べ替えは不要
  Future<List<SavedReceiptItem>> getItemList({required int receiptId}) async =>
      getItemCollection().where().receiptIdEqualTo(receiptId).findAll();

  /// 保存済みの品目すべて（id の昇順。データエクスポート用）
  Future<List<SavedReceiptItem>> getAllItemList() async => getItemCollection().where().findAll();

  /// レシートを一括登録する（データインポート用）。id はそのまま使うので、同じ id があれば上書きになる
  Future<void> inputReceiptList({required List<SavedReceipt> receiptList}) async {
    await isar.writeTxn(() async {
      await getReceiptCollection().putAll(receiptList);
    });
  }

  /// 品目を一括登録する（データインポート用）。id はそのまま使うので、同じ id があれば上書きになる
  Future<void> inputItemList({required List<SavedReceiptItem> itemList}) async {
    await isar.writeTxn(() async {
      await getItemCollection().putAll(itemList);
    });
  }
}
