import 'package:flutter/material.dart';

import '../collections/saved_receipt.dart';
import '../utility/extensions.dart';
import 'parts/receipt_dialog.dart';
import 'saved_receipt_list_alert.dart';

/// 1か月分のカレンダー（ホームのタブ1つ分）
/// その日のマスに、レシートの枚数と合計金額を出す
class MonthlyReceiptCalendarPage extends StatelessWidget {
  const MonthlyReceiptCalendarPage({super.key, required this.yearmonth, required this.receiptList});

  /// 表示する年月（yyyy-MM）
  final String yearmonth;

  /// 保存済みのレシート（全件。この月の分だけを日ごとに集計して使う）
  final List<SavedReceipt> receiptList;

  static const List<String> weekdayLabelList = <String>['日', '月', '火', '水', '木', '金', '土'];

  @override
  Widget build(BuildContext context) {
    final List<String> parts = yearmonth.split('-');
    final int year = int.tryParse(parts[0]) ?? DateTime.now().year;
    final int month = parts.length > 1 ? (int.tryParse(parts[1]) ?? DateTime.now().month) : DateTime.now().month;

    final DateTime firstDay = DateTime(year, month);
    final int dayCount = DateTime(year, month + 1, 0).day;

    // 日曜始まり：DateTime.weekday は 月=1 … 日=7 なので、7 で割った余りが「1日の前の空きマス数」になる
    final int leadingBlankCount = firstDay.weekday % 7;
    final int weekCount = ((leadingBlankCount + dayCount) / 7).ceil();

    final DateTime now = DateTime.now();

    // 日付（yyyy-MM-dd）ごとの枚数と合計金額。合計金額が読めなかったレシートは、枚数にだけ数える
    final Map<String, int> receiptCountMap = <String, int>{};
    final Map<String, int> totalPriceMap = <String, int>{};
    for (final SavedReceipt savedReceipt in receiptList) {
      final String? date = savedReceipt.date;
      if (date == null || !date.startsWith('$yearmonth-')) {
        continue;
      }
      receiptCountMap[date] = (receiptCountMap[date] ?? 0) + 1;
      totalPriceMap[date] = (totalPriceMap[date] ?? 0) + (savedReceipt.total ?? 0);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              for (int i = 0; i < 7; i++)
                Expanded(
                  child: Center(
                    child: Text(weekdayLabelList[i], style: TextStyle(fontSize: 12, color: _weekdayColor(i))),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          for (int week = 0; week < weekCount; week++)
            Row(
              children: <Widget>[
                for (int i = 0; i < 7; i++)
                  Expanded(
                    child: _buildDayCell(
                      context: context,
                      day: week * 7 + i - leadingBlankCount + 1,
                      dayCount: dayCount,
                      weekdayIndex: i,
                      isToday: (int day) => year == now.year && month == now.month && day == now.day,
                      receiptCountMap: receiptCountMap,
                      totalPriceMap: totalPriceMap,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  ///
  Widget _buildDayCell({
    required BuildContext context,
    required int day,
    required int dayCount,
    required int weekdayIndex,
    required bool Function(int day) isToday,
    required Map<String, int> receiptCountMap,
    required Map<String, int> totalPriceMap,
  }) {
    // 月の前後の空きマス
    if (day < 1 || day > dayCount) {
      return const SizedBox(height: 70);
    }

    final String date = '$yearmonth-${day.toString().padLeft(2, '0')}';
    final int receiptCount = receiptCountMap[date] ?? 0;

    final Widget cell = Container(
      height: 70,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(4),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        color: isToday(day) ? Colors.teal.withValues(alpha: 0.3) : null,
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(day.toString(), style: TextStyle(fontSize: 12, color: _weekdayColor(weekdayIndex))),
          if (receiptCount > 0) ...<Widget>[
            Text('$receiptCount枚', style: const TextStyle(fontSize: 10)),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text((totalPriceMap[date] ?? 0).toYen(), style: const TextStyle(fontSize: 10)),
            ),
          ],
        ],
      ),
    );

    // レシートのある日だけ、タップでその日のリストを開く
    if (receiptCount == 0) {
      return cell;
    }

    return GestureDetector(
      onTap: () => ReceiptDialog(context: context, widget: SavedReceiptListAlert(date: date)),
      child: cell,
    );
  }

  /// 日曜は赤、土曜は青、ほかは白
  Color _weekdayColor(int weekdayIndex) {
    if (weekdayIndex == 0) {
      return Colors.redAccent;
    }
    if (weekdayIndex == 6) {
      return Colors.lightBlueAccent;
    }
    return Colors.white;
  }
}
