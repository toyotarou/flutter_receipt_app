// import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// import '../api/receipt_api.dart';
import '../models/receipt.dart';
// import '../repository/receipts_repository.dart';
import '../utility/extensions.dart';
// import 'parts/receipt_dialog.dart';
// import 'saved_receipt_list_alert.dart';

// 以前のホーム画面。撮影・読み取り・保存の機能は receipt_camera_alert.dart（ReceiptCameraAlert）に移し、
// ホーム画面は home_page.dart（HomePage）に替えたため、使わなくなった。念のためコメントアウトで残す
// class ReceiptPage extends HookConsumerWidget {
//   const ReceiptPage({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ValueNotifier<bool> isLoading = useState(false);
//     final ValueNotifier<String?> imagePath = useState<String?>(null);
//     final ValueNotifier<Receipt?> receipt = useState<Receipt?>(null);
//     final ValueNotifier<String?> rawJsonText = useState<String?>(null);
//     final ValueNotifier<String?> errorText = useState<String?>(null);
//     final ValueNotifier<bool> isSaved = useState(false);
//
//     // 画像をサーバへ送り、結果を表示する
//     Future<void> sendImage(String path) async {
//       debugPrint('[receipt] 送信開始: $path');
//       imagePath.value = path;
//       receipt.value = null;
//       rawJsonText.value = null;
//       errorText.value = null;
//       isSaved.value = false;
//       isLoading.value = true;
//
//       try {
//         final Map<String, dynamic> json = await ref.read(receiptApiProvider).analyze(path);
//         debugPrint('[receipt] 送信成功');
//         rawJsonText.value = const JsonEncoder.withIndent('  ').convert(json);
//         receipt.value = Receipt.fromJson(json);
//       } catch (e) {
//         debugPrint('[receipt] 送信エラー: $e');
//         errorText.value = e.toString();
//       } finally {
//         isLoading.value = false;
//       }
//     }
//
//     // Android：カメラ中にアプリが終了させられた場合、撮った写真をここで取り戻す
//     useEffect(() {
//       if (Platform.isAndroid) {
//         ImagePicker().retrieveLostData().then((LostDataResponse response) {
//           if (response.isEmpty) {
//             return;
//           }
//           debugPrint('[receipt] 失われた画像を回復');
//           final XFile? file = response.file;
//           if (file != null) {
//             sendImage(file.path);
//           } else if (response.exception != null) {
//             errorText.value = '画像の回復に失敗しました: ${response.exception}';
//           }
//         });
//       }
//       return null;
//     }, const <Object?>[]);
//
//     // 読み取り結果を内蔵DB（Isar）に保存する
//     Future<void> saveReceipt(Receipt data) async {
//       try {
//         final ReceiptsRepository repository = ref.read(receiptsRepositoryProvider);
//         final int receiptId = await repository.saveReceipt(receipt: data);
//         final int count = await repository.countReceipts();
//         debugPrint('[receipt] 保存成功: id=$receiptId 保存済み=$count件');
//         isSaved.value = true;
//         if (!context.mounted) {
//           return;
//         }
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('保存しました（保存済み：$count件）')));
//       } catch (e) {
//         debugPrint('[receipt] 保存エラー: $e');
//         errorText.value = '保存でエラー: $e';
//       }
//     }
//
//     Future<void> pickAndSend(ImageSource source) async {
//       debugPrint('[receipt] 画像選択開始: $source');
//       errorText.value = null;
//
//       XFile? picked;
//       try {
//         // 長辺1600px・JPEG品質85に縮小してから送る（PHPのアップロード上限2MBに収めるため）
//         picked = await ImagePicker().pickImage(source: source, maxWidth: 1600, maxHeight: 1600, imageQuality: 85);
//       } catch (e) {
//         debugPrint('[receipt] 画像選択エラー: $e');
//         errorText.value = '画像の取得でエラー: $e';
//         return;
//       }
//
//       if (picked == null) {
//         debugPrint('[receipt] 画像が null');
//         errorText.value = '画像を受け取れませんでした（キャンセルした場合は、もう一度お試しください）';
//         return;
//       }
//
//       await sendImage(picked.path);
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('レシート読み取り'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.list_alt),
//             tooltip: '保存したレシート',
//             onPressed: () => ReceiptDialog(context: context, widget: const SavedReceiptListAlert()),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: FilledButton.icon(
//                       onPressed: isLoading.value ? null : () => pickAndSend(ImageSource.camera),
//                       icon: const Icon(Icons.photo_camera),
//                       label: const Text('カメラで撮る'),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: OutlinedButton.icon(
//                       onPressed: isLoading.value ? null : () => pickAndSend(ImageSource.gallery),
//                       icon: const Icon(Icons.photo_library),
//                       label: const Text('写真から選ぶ'),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               if (imagePath.value != null) Image.file(File(imagePath.value!), height: 160, fit: BoxFit.contain),
//               const SizedBox(height: 16),
//               if (isLoading.value)
//                 const Column(
//                   children: <Widget>[CircularProgressIndicator(), SizedBox(height: 8), Text('AIが読み取り中です（10〜30秒ほどかかります）')],
//                 ),
//               if (errorText.value != null) Text(errorText.value!, style: const TextStyle(color: Colors.red)),
//               if (receipt.value != null) ReceiptResultView(receipt: receipt.value!),
//               if (receipt.value != null)
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: FilledButton.icon(
//                     onPressed: isSaved.value ? null : () => saveReceipt(receipt.value!),
//                     icon: Icon(isSaved.value ? Icons.check : Icons.save),
//                     label: Text(isSaved.value ? '保存しました' : 'この内容を保存する'),
//                   ),
//                 ),
//               if (rawJsonText.value != null)
//                 ExpansionTile(
//                   title: const Text('JSONを見る（確認用）'),
//                   children: <Widget>[
//                     SelectableText(rawJsonText.value!, style: const TextStyle(fontFamily: 'monospace', fontSize: 12)),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

/// 読み取り結果をレシート風に表示する
class ReceiptResultView extends StatelessWidget {
  const ReceiptResultView({super.key, required this.receipt});

  final Receipt receipt;

  List<String> _checkMessages() {
    final List<String> messages = <String>[];
    final ReceiptChecks? checks = receipt.checks;
    if (checks == null) {
      return messages;
    }
    if (!checks.subtotalOk) {
      messages.add('品目の合計（${checks.itemsSum.toYen()}）と小計（${receipt.subtotal?.toYen() ?? '不明'}）が合いません');
    }
    if (!checks.totalOk) {
      messages.add('小計・税・合計の関係が合いません');
    }
    if (checks.lineErrors.isNotEmpty) {
      messages.add('「単価×個数」と金額が合わない品目があります（赤い行）');
    }
    return messages;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<String> messages = _checkMessages();
    final List<int> lineErrors = receipt.checks?.lineErrors ?? const <int>[];
    final int discount = receipt.discount ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (receipt.needsCheck)
          Card(
            color: theme.colorScheme.errorContainer,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.warning_amber, color: theme.colorScheme.onErrorContainer),
                      const SizedBox(width: 8),
                      Text(
                        '要確認',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onErrorContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  for (final String message in messages)
                    Text('・$message', style: TextStyle(color: theme.colorScheme.onErrorContainer)),
                ],
              ),
            ),
          ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  receipt.storeName ?? '店名不明',
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text('${receipt.date ?? '日付不明'}  ${receipt.time ?? ''}'),
                if (receipt.paymentMethod != null) Text('支払い：${receipt.paymentMethod}'),
              ],
            ),
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < receipt.items.length; i++)
                _ItemRow(item: receipt.items[i], hasError: lineErrors.contains(i)),
            ],
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                _TotalRow(label: '小計', value: receipt.subtotal),
                if (discount > 0) _TotalRow(label: '値引き', value: -discount),
                _TotalRow(label: '消費税', value: receipt.tax),
                const Divider(),
                _TotalRow(label: '合計', value: receipt.total, isBold: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item, required this.hasError});

  final ReceiptItem item;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final int quantity = item.quantity ?? 1;
    final bool showDetail = quantity > 1 && item.unitPrice != null;

    return Container(
      color: hasError ? theme.colorScheme.errorContainer : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.name, style: const TextStyle(fontSize: 12)),
                if (showDetail) Text('$quantity個 × ${item.unitPrice!.toYen()}', style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          ),
          if (item.taxRate != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _TaxBadge(rate: item.taxRate!),
            ),
          Text(item.price.toYen(), style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class _TaxBadge extends StatelessWidget {
  const _TaxBadge({required this.rate});

  final int rate;

  @override
  Widget build(BuildContext context) {
    final MaterialColor color = rate == 8 ? Colors.teal : Colors.grey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(rate == 8 ? '軽8%' : '$rate%', style: TextStyle(fontSize: 10, color: color)),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label, required this.value, this.isBold = false});

  final String label;
  final int? value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final TextStyle? style = isBold
        ? Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
        : Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: <Widget>[
          Text(label, style: style),
          const Spacer(),
          Text(value?.toYen() ?? '−', style: style),
        ],
      ),
    );
  }
}
