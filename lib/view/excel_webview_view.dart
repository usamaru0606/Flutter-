import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/packageadapter/excel_file_service_provider.dart';
import 'package:mobile_app/provider/viewmodel/excel_webview_view_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../model/excel_file.dart';

/// Excelを WebView で表示する画面
class ExcelWebView extends ConsumerWidget {
  final ExcelFile file;

  const ExcelWebView({super.key, required this.file});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ExcelWebViewViewProvider(ref.read(webViewAdapterProvider));

    final controller = provider.buildController(file.localPath);

    return Scaffold(
      appBar: AppBar(title: Text(file.name)),
      body: WebViewWidget(controller: controller),
    );
  }
}
