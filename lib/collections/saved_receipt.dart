import 'package:isar_community/isar.dart';

part 'saved_receipt.g.dart';

/// 保存したレシート（1枚分）
@collection
class SavedReceipt {
  Id id = Isar.autoIncrement;

  /// 店名
  String? store;

  /// 日付（yyyy-MM-dd）
  @Index()
  String? date;

  /// 時刻（HH:mm）
  String? time;

  /// 支払い方法（現金・カードなど）
  String? payMethod;

  /// 小計
  int? sum;

  /// 消費税
  int? tax;

  /// 値引き
  int? discount;

  /// 合計
  int? total;

  /// お買上商品数（レシートに印字された数）
  int? itemCount;

  /// 検算が合わず、目で確かめる必要があるか
  bool needsCheck = false;

  /// 保存した日時
  late DateTime createdAt;
}

/// 保存したレシートの品目（1行分）
@collection
class SavedReceiptItem {
  Id id = Isar.autoIncrement;

  /// どのレシートの品目か（SavedReceipt.id）
  @Index()
  late int receiptId;

  /// 品名
  late String item;

  /// 個数
  int? quantity;

  /// 単価
  int? unitPrice;

  /// 金額
  late int price;

  /// 税率（8 または 10）
  int? taxRate;
}
