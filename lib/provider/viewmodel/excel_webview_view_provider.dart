import 'package:mobile_app/provider/packageadapter/webview_adapter.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// WebView表示用の ViewProvider
/// Adapter 経由で WebViewController を生成
class ExcelWebViewViewProvider {
  final WebViewAdapter adapter;

  ExcelWebViewViewProvider(this.adapter);

  WebViewController buildController(String path) {
    return adapter.createController(path);
  }
}
