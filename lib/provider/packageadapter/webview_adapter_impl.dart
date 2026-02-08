import 'package:webview_flutter/webview_flutter.dart';
import 'webview_adapter.dart';

/// WebView の具体実装
/// webview_flutter への依存はこのクラスに閉じ込める
class WebViewAdapterImpl implements WebViewAdapter {
  @override
  WebViewController createController(String path) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(path));
  }
}
