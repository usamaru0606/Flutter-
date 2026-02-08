import 'package:webview_flutter/webview_flutter.dart';

/// WebView パッケージ依存を隠蔽するための Adapter interface
/// ViewProvider はこの interface のみを知る
abstract class WebViewAdapter {
  WebViewController createController(String path);
}
