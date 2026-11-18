import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../collections/saved_receipt.dart';
import '../repository/receipts_repository.dart';
import '../utility/extensions.dart';
import 'parts/receipt_dialog.dart';
import 'saved_receipt_detail_alert.dart';

/// 保存したレシートの一覧（date を渡したときは、その日のレシートだけを出す）
class SavedReceiptListAlert extends HookConsumerWidget {
  const SavedReceiptListAlert({super.key, this.date});

  /// 絞り込む日付（yyyy-MM-dd）。null のときは全件
  final String? date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // アラートを開いたときと、詳細アラートを閉じたとき（削除したかもしれないので）に読み直す
    final ValueNotifier<int> reloadCount = useState(0);
    final Future<List<SavedReceipt>> receiptListFuture = useMemoized(
      () {
        final ReceiptsRepository repository = ref.read(receiptsRepositoryProvider);
        final String? targetDate = date;
        return targetDate == null ? repository.getReceiptList() : repository.getReceiptListByDate(date: targetDate);
      },
      <Object?>[reloadCount.value, date],
    );
    final AsyncSnapshot<List<SavedReceipt>> receiptListSnapshot = useFuture(receiptListFuture);

    // 詳細アラートを開き、閉じたら一覧を読み直す
    Future<void> openDetail(SavedReceipt savedReceipt) async {
      await ReceiptDialog(context: context, widget: SavedReceiptDetailAlert(savedReceipt: savedReceipt));
      if (!context.mounted) {
        return;
      }
      reloadCount.value++;
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  date == null ? '保存したレシート' : '保存したレシート（$date）',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (receiptListSnapshot.hasData) Text('${receiptListSnapshot.data!.length}件'),
            ],
          ),
          const Divider(),
          Expanded(
            child: _buildBody(snapshot: receiptListSnapshot, onDetailPressed: openDetail),
          ),
        ],
      ),
    );
  }

  ///
  Widget _buildBody({
    required AsyncSnapshot<List<SavedReceipt>> snapshot,
    required Future<void> Function(SavedReceipt savedReceipt) onDetailPressed,
  }) {
    // 読み込みが終わるまでは一覧（と詳細ボタン）を出さない
    if (snapshot.connectionState != ConnectionState.done) {
      return const Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Text('読み込みでエラー: ${snapshot.error}', style: const TextStyle(color: Colors.redAccent));
    }

    final List<SavedReceipt> receiptList = snapshot.data ?? <SavedReceipt>[];

    if (receiptList.isEmpty) {
      return const Center(child: Text('保存したレシートはありません'));
    }

    return ListView.separated(
      itemCount: receiptList.length,
      separatorBuilder: (_, __) => Divider(height: 1, color: Colors.white.withValues(alpha: 0.2)),
      itemBuilder: (BuildContext context, int index) {
        final SavedReceipt savedReceipt = receiptList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(savedReceipt.date ?? '日付不明', style: const TextStyle(fontSize: 12)),
                  Text(savedReceipt.time ?? '', style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  savedReceipt.store ?? '店名不明',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(width: 6),
              Text(savedReceipt.total?.toYen() ?? '−', style: const TextStyle(fontSize: 12)),
              if (savedReceipt.needsCheck)
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(Icons.warning_amber, size: 16, color: Colors.orangeAccent),
                ),
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.chevron_right),
                tooltip: '詳細',
                onPressed: () => onDetailPressed(savedReceipt),
              ),
            ],
          ),
        );
      },
    );
  }
}
