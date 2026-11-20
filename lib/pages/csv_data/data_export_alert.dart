import 'dart:convert';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../collections/saved_receipt.dart';
import '../../repository/receipts_repository.dart';

/// CSV の1行目に入れる目印（このアプリから出したファイルかどうかを、インポートで確かめる）
const String receiptCsvHeader = 'export_csv_from_receipt_reader';

/// エクスポートできるデータ（ファイル名の先頭にも使う。'_' は入れないこと）
const List<String> receiptCsvNameList = <String>['savedReceipt', 'savedReceiptItem'];

/// 画面に出す名前
const Map<String, String> receiptCsvLabelMap = <String, String>{
  'savedReceipt': 'レシート',
  'savedReceiptItem': 'レシートの品目',
};

/// データエクスポート（app-moneynote3-3 の DataExportAlert と同じ作り）
/// 丸を押してデータを選ぶ → 「csv選択」で送るファイルに加える → 「送信」で共有シートを開く
class DataExportAlert extends ConsumerStatefulWidget {
  const DataExportAlert({super.key});

  @override
  ConsumerState<DataExportAlert> createState() => _DataExportAlertState();
}

class _DataExportAlertState extends ConsumerState<DataExportAlert> {
  String csvName = '';

  final List<XFile> sendFileList = <XFile>[];
  final List<String> sendFileNameList = <String>[];

  ///
  @override
  Widget build(BuildContext context) {
    // 送るファイルに加えたデータ（丸を緑にする）
    final List<String> addedCsvNameList = <String>[
      for (final String fileName in sendFileNameList) fileName.split('_')[0],
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('データエクスポート', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(color: Colors.white.withValues(alpha: 0.4), thickness: 5),
            for (final String name in receiptCsvNameList)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => setState(() => csvName = name),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: addedCsvNameList.contains(name)
                            ? Colors.greenAccent.withValues(alpha: 0.3)
                            : csvName == name
                            ? Colors.yellowAccent.withValues(alpha: 0.3)
                            : Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(receiptCsvLabelMap[name] ?? name),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: csvOutput,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withValues(alpha: 0.2)),
                    child: const Text('csv選択'),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: csvSend,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withValues(alpha: 0.2)),
                    child: const Text('送信'),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.white.withValues(alpha: 0.4), thickness: 5),
            for (final String fileName in sendFileNameList) Text(fileName),
          ],
        ),
      ),
    );
  }

  /// 選んだデータを CSV にして、送るファイルに加える
  Future<void> csvOutput() async {
    if (csvName == '') {
      showErrorDialog(title: '出力できません。', content: '出力するデータを正しく選択してください。');
      return;
    }

    final ReceiptsRepository repository = ref.read(receiptsRepositoryProvider);

    // null は空文字で出す（インポートで空文字は null に戻す）
    final List<List<String>> rowList = <List<String>>[
      <String>[receiptCsvHeader],
    ];

    switch (csvName) {
      case 'savedReceipt':
        final List<SavedReceipt> receiptList = await repository.getReceiptList();
        for (final SavedReceipt element in receiptList) {
          rowList.add(<String>[
            element.id.toString(),
            element.store ?? '',
            element.date ?? '',
            element.time ?? '',
            element.payMethod ?? '',
            element.sum?.toString() ?? '',
            element.tax?.toString() ?? '',
            element.discount?.toString() ?? '',
            element.total?.toString() ?? '',
            element.itemCount?.toString() ?? '',
            element.needsCheck.toString(),
            element.createdAt.toIso8601String(),
          ]);
        }

      case 'savedReceiptItem':
        final List<SavedReceiptItem> itemList = await repository.getAllItemList();
        for (final SavedReceiptItem element in itemList) {
          rowList.add(<String>[
            element.id.toString(),
            element.receiptId.toString(),
            element.item,
            element.quantity?.toString() ?? '',
            element.unitPrice?.toString() ?? '',
            element.price.toString(),
            element.taxRate?.toString() ?? '',
          ]);
        }
    }

    // 店名・品名にカンマや改行が入っていても崩れないよう、csv パッケージで書き出す
    final String contents = const ListToCsvConverter(eol: '\n').convert(rowList);

    final DateTime now = DateTime.now();
    final String dateStr =
        '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}'
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';
    final String sendFileName = '${csvName}_$dateStr.csv';

    final Uint8List encoded = Uint8List.fromList(utf8.encode(contents));

    if (!mounted) {
      return;
    }

    setState(() {
      sendFileNameList.add(sendFileName);
      sendFileList.add(XFile.fromData(encoded, mimeType: 'text/plain'));
    });
  }

  /// 送るファイルを共有シートで送る
  Future<void> csvSend() async {
    if (sendFileList.isEmpty || sendFileNameList.isEmpty) {
      showErrorDialog(title: '送信できません。', content: '送信するデータを正しく選択してください。');
      return;
    }

    final RenderBox? box = context.findRenderObject() as RenderBox?;

    await SharePlus.instance.share(
      ShareParams(
        files: sendFileList,
        fileNameOverrides: sendFileNameList,
        sharePositionOrigin: box == null ? null : box.localToGlobal(Offset.zero) & box.size,
      ),
    );

    if (mounted) {
      sendFileNameList.clear();
      sendFileList.clear();

      Navigator.pop(context);
    }
  }

  ///
  void showErrorDialog({required String title, required String content}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[TextButton(onPressed: () => Navigator.pop(dialogContext), child: const Text('OK'))],
      ),
    );
  }
}
