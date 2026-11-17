import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final Provider<ReceiptApi> receiptApiProvider = Provider<ReceiptApi>((Ref ref) => ReceiptApi());

class ReceiptApi {
  static const String baseUrl = 'http://49.212.175.205:8090';

  // 合言葉は flutter run --dart-define=RECEIPT_APP_TOKEN=xxxx で渡す（ソースに書かない）
  static const String appToken = String.fromEnvironment('RECEIPT_APP_TOKEN');

  Future<Map<String, dynamic>> analyze(String imagePath) async {
    if (appToken.isEmpty) {
      throw Exception('RECEIPT_APP_TOKEN が設定されていません（--dart-define で指定してください）');
    }

    final http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('$baseUrl/api/receipt/analyze'));
    request.headers['Accept'] = 'application/json';
    request.headers['X-App-Token'] = appToken;
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    final http.StreamedResponse streamed = await request.send().timeout(const Duration(seconds: 150));
    final http.Response response = await http.Response.fromStream(streamed);
    final String body = utf8.decode(response.bodyBytes);

    if (response.statusCode != 200) {
      throw Exception('サーバエラー (${response.statusCode}): $body');
    }

    // ignore: always_specify_types
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw Exception('想定外の返答: $body');
    }
    return decoded;
  }
}
