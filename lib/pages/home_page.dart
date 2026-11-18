import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../collections/saved_receipt.dart';
import '../repository/receipts_repository.dart';
import 'monthly_receipt_calendar_page.dart';
import 'parts/receipt_dialog.dart';
import 'receipt_camera_alert.dart';
import 'saved_receipt_list_alert.dart';

/// ホーム画面（年月のタブ＋月ごとのカレンダー。flutter_lifetime_log2 のホーム画面と同じ形）
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 保存・削除すると一覧が流れてきて、タブ（年月）が作り直される
    final AsyncValue<List<SavedReceipt>> receiptListAsync = ref.watch(savedReceiptListProvider);

    final List<SavedReceipt> receiptList = receiptListAsync.value ?? <SavedReceipt>[];

    final List<String> yearmonthList = _makeYearmonthList(receiptList: receiptList);

    return DefaultTabController(
      length: yearmonthList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('レシート読み取り'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.photo_camera),
              tooltip: 'レシートを読み取る',
              onPressed: () => ReceiptDialog(context: context, widget: const ReceiptCameraAlert()),
            ),
            IconButton(
              icon: const Icon(Icons.list_alt),
              tooltip: '保存したレシート',
              onPressed: () => ReceiptDialog(context: context, widget: const SavedReceiptListAlert()),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: <Widget>[for (final String yearmonth in yearmonthList) Tab(text: yearmonth)],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            for (final String yearmonth in yearmonthList)
              MonthlyReceiptCalendarPage(
                key: ValueKey<String>(yearmonth),
                yearmonth: yearmonth,
                receiptList: receiptList,
              ),
          ],
        ),
      ),
    );
  }

  /// タブにする年月（yyyy-MM）の一覧。今月と、保存したレシートの日付がある月。新しい月が先頭
  List<String> _makeYearmonthList({required List<SavedReceipt> receiptList}) {
    final DateTime now = DateTime.now();
    final Set<String> yearmonthSet = <String>{'${now.year}-${now.month.toString().padLeft(2, '0')}'};

    final RegExp datePattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');

    for (final SavedReceipt savedReceipt in receiptList) {
      final String? date = savedReceipt.date;
      // 日付が読めなかったレシート（null や形の違うもの）はタブにしない
      if (date != null && datePattern.hasMatch(date)) {
        yearmonthSet.add(date.substring(0, 7));
      }
    }

    // yyyy-MM は文字列の比較で年月順になる
    return yearmonthSet.toList()..sort((String a, String b) => b.compareTo(a));
  }
}
