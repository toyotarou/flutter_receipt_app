import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../collections/saved_receipt.dart';
import '../models/receipt.dart';
import '../repository/receipts_repository.dart';
import 'receipt_page.dart';

/// 保存したレシート1枚の詳細
class SavedReceiptDetailAlert extends HookConsumerWidget {
  const SavedReceiptDetailAlert({super.key, required this.savedReceipt});

  final SavedReceipt savedReceipt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Future<List<SavedReceiptItem>> itemListFuture = useMemoized(
      () => ref.read(receiptsRepositoryProvider).getItemList(receiptId: savedReceipt.id),
    );
    final AsyncSnapshot<List<SavedReceiptItem>> itemListSnapshot = useFuture(itemListFuture);
    final ValueNotifier<bool> isDeleting = useState(false);
    final ValueNotifier<String?> errorText = useState<String?>(null);

    // このレシートを削除して、一覧のアラートに戻る
    Future<void> deleteReceipt() async {
      isDeleting.value = true;
      errorText.value = null;
      try {
        await ref.read(receiptsRepositoryProvider).deleteReceipt(receiptId: savedReceipt.id);
        debugPrint('[receipt] 削除成功: id=${savedReceipt.id}');
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop();
      } catch (e) {
        debugPrint('[receipt] 削除エラー: $e');
        if (!context.mounted) {
          return;
        }
        errorText.value = '削除でエラー: $e';
        isDeleting.value = false;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text('レシートの詳細', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(child: _buildBody(snapshot: itemListSnapshot)),
          if (errorText.value != null) Text(errorText.value!, style: const TextStyle(color: Colors.redAccent)),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: isDeleting.value ? null : deleteReceipt,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.redAccent,
              side: const BorderSide(color: Colors.redAccent),
            ),
            icon: const Icon(Icons.delete_outline),
            label: const Text('このレシートを削除する'),
          ),
        ],
      ),
    );
  }

  ///
  Widget _buildBody({required AsyncSnapshot<List<SavedReceiptItem>> snapshot}) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Text('読み込みでエラー: ${snapshot.error}', style: const TextStyle(color: Colors.redAccent));
    }

    // 読み取った直後と同じ見た目で出すため、保存データを Receipt に戻して ReceiptResultView で表示する
    final Receipt receipt = _toReceipt(itemList: snapshot.data ?? <SavedReceiptItem>[]);

    return SingleChildScrollView(child: ReceiptResultView(receipt: receipt));
  }

  ///
  Receipt _toReceipt({required List<SavedReceiptItem> itemList}) {
    return Receipt(
      storeName: savedReceipt.store,
      date: savedReceipt.date,
      time: savedReceipt.time,
      items: <ReceiptItem>[
        for (final SavedReceiptItem item in itemList)
          ReceiptItem(
            name: item.item,
            quantity: item.quantity,
            unitPrice: item.unitPrice,
            price: item.price,
            taxRate: item.taxRate,
          ),
      ],
      itemCount: savedReceipt.itemCount,
      subtotal: savedReceipt.sum,
      tax: savedReceipt.tax,
      discount: savedReceipt.discount,
      total: savedReceipt.total,
      paymentMethod: savedReceipt.payMethod,
      needsCheck: savedReceipt.needsCheck,
    );
  }
}
