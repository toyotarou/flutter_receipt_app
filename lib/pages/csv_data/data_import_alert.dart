import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../collections/saved_receipt.dart';
import '../../repository/receipts_repository.dart';
import '../../utility/extensions.dart';
import 'data_export_alert.dart';

/// データインポート（app-moneynote3-3 の DataImportAlert と同じ作り）
/// 「CSV選択」でファイルを選ぶ → 中身を確かめる → 「登録」で保存する
///
/// id は CSV の値のまま登録する（品目の receiptId とレシートの id のつながりを保つため）。
/// 同じ id のデータがすでにあるときは、CSV の内容で上書きされる（同じファイルを2回入れても重複しない）
class DataImportAlert extends ConsumerStatefulWidget {
  const DataImportAlert({super.key});

  @override
  ConsumerState<DataImportAlert> createState() => _DataImportAlertState();
}

class _DataImportAlertState extends ConsumerState<DataImportAlert> {
  String fileName = '';

  String csvName = '';

  /// 画面に出す CSV の中身（1行目の目印は除く）
  List<List<String>> csvRowList = <List<String>>[];

  List<SavedReceipt> importReceiptList = <SavedReceipt>[];
  List<SavedReceiptItem> importItemList = <SavedReceiptItem>[];

  ///
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('データインポート', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(color: Colors.white.withValues(alpha: 0.4), thickness: 5),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: _pickAndLoadCsvFile,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withValues(alpha: 0.2)),
                  child: const Text('CSV選択'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: registData,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent.withValues(alpha: 0.2)),
                  child: const Text('登録'),
                ),
              ),
            ],
          ),
          Divider(color: Colors.white.withValues(alpha: 0.4), thickness: 5),
          Text(fileName),
          if (csvRowList.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(receiptCsvLabelMap[csvName] ?? csvName),
                Text('${csvRowList.length} records.', style: const TextStyle(color: Colors.yellowAccent)),
              ],
            ),
          const SizedBox(height: 20),
          Expanded(child: displayCsvContents()),
        ],
      ),
    );
  }

  /// CSV を選んで読み込み、登録するデータを作る
  Future<void> _pickAndLoadCsvFile() async {
    final PlatformFile? result = await FilePicker.pickFile(type: FileType.custom, allowedExtensions: <String>['csv']);

    if (result == null || result.path == null) {
      return;
    }

    final String pickedFileName = result.name;
    final String pickedCsvName = pickedFileName.split('_')[0];

    final String csvString = await File(result.path!).readAsString();

    if (!mounted) {
      return;
    }

    // shouldParseNumbers: false で、すべて文字列のまま受け取る
    final List<List<String>> allRowList = const CsvToListConverter(eol: '\n', shouldParseNumbers: false)
        .convert(csvString.replaceAll('\r\n', '\n'))
        .map((List<dynamic> row) => row.map((dynamic e) => e.toString()).toList())
        .toList();

    // このアプリから出した CSV で、ファイル名が分かるものだけ受け付ける
    if (allRowList.isEmpty ||
        allRowList[0].isEmpty ||
        allRowList[0][0].trim() != receiptCsvHeader ||
        !receiptCsvNameList.contains(pickedCsvName)) {
      _clearData();
      showErrorDialog(title: '読み込めません。', content: 'このアプリからエクスポートしたCSVを選択してください。');
      return;
    }

    // 空行は飛ばす
    final List<List<String>> rowList = <List<String>>[
      for (int i = 1; i < allRowList.length; i++)
        if (!(allRowList[i].length == 1 && allRowList[i][0].trim() == '')) allRowList[i],
    ];

    final List<SavedReceipt> receiptList = <SavedReceipt>[];
    final List<SavedReceiptItem> itemList = <SavedReceiptItem>[];

    for (final List<String> exLine in rowList) {
      switch (pickedCsvName) {
        case 'savedReceipt':
          if (exLine.length < 12) {
            _clearData();
            showErrorDialog(title: '読み込めません。', content: '列の数が足りない行があります。\n${exLine.join(',')}');
            return;
          }

          receiptList.add(
            SavedReceipt()
              ..id = exLine[0].trim().toInt()
              ..store = _toNullableString(exLine[1])
              ..date = _toNullableString(exLine[2])
              ..time = _toNullableString(exLine[3])
              ..payMethod = _toNullableString(exLine[4])
              ..sum = exLine[5].toIntOrNull()
              ..tax = exLine[6].toIntOrNull()
              ..discount = exLine[7].toIntOrNull()
              ..total = exLine[8].toIntOrNull()
              ..itemCount = exLine[9].toIntOrNull()
              ..needsCheck = exLine[10].trim() == 'true'
              ..createdAt = DateTime.tryParse(exLine[11].trim()) ?? DateTime.now(),
          );

        case 'savedReceiptItem':
          if (exLine.length < 7) {
            _clearData();
            showErrorDialog(title: '読み込めません。', content: '列の数が足りない行があります。\n${exLine.join(',')}');
            return;
          }

          itemList.add(
            SavedReceiptItem()
              ..id = exLine[0].trim().toInt()
              ..receiptId = exLine[1].trim().toInt()
              ..item = exLine[2]
              ..quantity = exLine[3].toIntOrNull()
              ..unitPrice = exLine[4].toIntOrNull()
              ..price = exLine[5].toInt()
              ..taxRate = exLine[6].toIntOrNull(),
          );
      }
    }

    if (!mounted) {
      return;
    }

    setState(() {
      fileName = pickedFileName;
      csvName = pickedCsvName;
      csvRowList = rowList;
      importReceiptList = receiptList;
      importItemList = itemList;
    });
  }

  /// 空文字は null に戻す
  String? _toNullableString(String value) => value.trim() == '' ? null : value;

  ///
  void _clearData() {
    setState(() {
      fileName = '';
      csvName = '';
      csvRowList = <List<String>>[];
      importReceiptList = <SavedReceipt>[];
      importItemList = <SavedReceiptItem>[];
    });
  }

  /// 読み込んだ CSV の中身（id の列は出さない）
  Widget displayCsvContents() {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final List<String> exLine in csvRowList)
              Row(
                children: <Widget>[
                  for (int j = 1; j < exLine.length; j++)
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(border: Border.all(color: Colors.white.withValues(alpha: 0.2))),
                      child: Text(exLine[j], maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  /// 読み込んだデータを保存する
  Future<void> registData() async {
    if (csvName == '' || csvRowList.isEmpty) {
      showErrorDialog(title: '登録できません。', content: '登録するCSVを選択してください。');
      return;
    }

    final ReceiptsRepository repository = ref.read(receiptsRepositoryProvider);

    // 一括登録は1トランザクション。失敗したらダイアログで知らせる
    try {
      switch (csvName) {
        case 'savedReceipt':
          await repository.inputReceiptList(receiptList: importReceiptList);

        case 'savedReceiptItem':
          await repository.inputItemList(itemList: importItemList);
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      showErrorDialog(title: '登録できませんでした。', content: e.toString());
    }
  }

  ///
  void showErrorDialog({required String title, required String content}) {
    if (!mounted) {
      return;
    }

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
