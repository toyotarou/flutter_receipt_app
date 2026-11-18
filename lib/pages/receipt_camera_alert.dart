import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../api/receipt_api.dart';
import '../models/receipt.dart';
import '../repository/receipts_repository.dart';
import 'receipt_page.dart';

/// レシートを撮影して読み取り、結果を表示・保存するアラート（以前のホーム画面の機能）
class ReceiptCameraAlert extends HookConsumerWidget {
  const ReceiptCameraAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> isLoading = useState(false);
    final ValueNotifier<String?> imagePath = useState<String?>(null);
    final ValueNotifier<Receipt?> receipt = useState<Receipt?>(null);
    final ValueNotifier<String?> rawJsonText = useState<String?>(null);
    final ValueNotifier<String?> errorText = useState<String?>(null);
    final ValueNotifier<bool> isSaved = useState(false);

    // 画像をサーバへ送り、結果を表示する
    Future<void> sendImage(String path) async {
      debugPrint('[receipt] 送信開始: $path');
      imagePath.value = path;
      receipt.value = null;
      rawJsonText.value = null;
      errorText.value = null;
      isSaved.value = false;
      isLoading.value = true;

      try {
        final Map<String, dynamic> json = await ref.read(receiptApiProvider).analyze(path);
        debugPrint('[receipt] 送信成功');
        if (!context.mounted) {
          return;
        }
        rawJsonText.value = const JsonEncoder.withIndent('  ').convert(json);
        receipt.value = Receipt.fromJson(json);
      } catch (e) {
        debugPrint('[receipt] 送信エラー: $e');
        if (!context.mounted) {
          return;
        }
        errorText.value = e.toString();
      } finally {
        if (context.mounted) {
          isLoading.value = false;
        }
      }
    }

    // Android：カメラ中にアプリが終了させられた場合、撮った写真をここで取り戻す
    // （アプリが立ち上がり直したあと、このアラートを開いたときに回復して読み取る）
    useEffect(() {
      if (Platform.isAndroid) {
        ImagePicker().retrieveLostData().then((LostDataResponse response) {
          if (response.isEmpty) {
            return;
          }
          debugPrint('[receipt] 失われた画像を回復');
          final XFile? file = response.file;
          if (file != null) {
            sendImage(file.path);
          } else if (response.exception != null) {
            errorText.value = '画像の回復に失敗しました: ${response.exception}';
          }
        });
      }
      return null;
    }, const <Object?>[]);

    // 読み取り結果を内蔵DB（Isar）に保存する
    Future<void> saveReceipt(Receipt data) async {
      try {
        final ReceiptsRepository repository = ref.read(receiptsRepositoryProvider);
        final int receiptId = await repository.saveReceipt(receipt: data);
        final int count = await repository.countReceipts();
        debugPrint('[receipt] 保存成功: id=$receiptId 保存済み=$count件');
        if (!context.mounted) {
          return;
        }
        isSaved.value = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('保存しました（保存済み：$count件）')));
      } catch (e) {
        debugPrint('[receipt] 保存エラー: $e');
        if (!context.mounted) {
          return;
        }
        errorText.value = '保存でエラー: $e';
      }
    }

    // カメラで撮影して送る
    Future<void> takePhotoAndSend() async {
      debugPrint('[receipt] 撮影開始');
      errorText.value = null;

      XFile? picked;
      try {
        // 長辺1600px・JPEG品質85に縮小してから送る（PHPのアップロード上限2MBに収めるため）
        picked = await ImagePicker().pickImage(
          source: ImageSource.camera,
          maxWidth: 1600,
          maxHeight: 1600,
          imageQuality: 85,
        );
      } catch (e) {
        debugPrint('[receipt] 撮影エラー: $e');
        if (!context.mounted) {
          return;
        }
        errorText.value = '画像の取得でエラー: $e';
        return;
      }

      if (!context.mounted) {
        return;
      }

      if (picked == null) {
        debugPrint('[receipt] 画像が null');
        errorText.value = '画像を受け取れませんでした（キャンセルした場合は、もう一度お試しください）';
        return;
      }

      await sendImage(picked.path);
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text('レシートを読み取る', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  FilledButton.icon(
                    onPressed: isLoading.value ? null : takePhotoAndSend,
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('カメラで撮る'),
                  ),
                  const SizedBox(height: 16),
                  if (imagePath.value != null) Image.file(File(imagePath.value!), height: 160, fit: BoxFit.contain),
                  const SizedBox(height: 16),
                  if (isLoading.value)
                    const Column(
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 8),
                        Text('AIが読み取り中です（10〜30秒ほどかかります）'),
                      ],
                    ),
                  if (errorText.value != null) Text(errorText.value!, style: const TextStyle(color: Colors.red)),
                  if (receipt.value != null) ReceiptResultView(receipt: receipt.value!),
                  if (receipt.value != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: FilledButton.icon(
                        onPressed: isSaved.value ? null : () => saveReceipt(receipt.value!),
                        icon: Icon(isSaved.value ? Icons.check : Icons.save),
                        label: Text(isSaved.value ? '保存しました' : 'この内容を保存する'),
                      ),
                    ),
                  if (rawJsonText.value != null)
                    ExpansionTile(
                      title: const Text('JSONを見る（確認用）'),
                      children: <Widget>[
                        SelectableText(
                          rawJsonText.value!,
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
