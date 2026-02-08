import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/packageadapter/excel_table_adapter.dart';
import 'package:mobile_app/provider/packageadapter/excel_table_adapter_impl.dart';
import 'package:mobile_app/provider/packageadapter/webview_adapter.dart';
import 'package:mobile_app/provider/packageadapter/webview_adapter_impl.dart';
import 'package:mobile_app/service/excel_file_service.dart';

/// ExcelFileService を提供する Provider
final excelFileServiceProvider = Provider((ref) => ExcelFileService());

/// WebViewAdapter を Provider 経由で提供
final webViewAdapterProvider = Provider<WebViewAdapter>(
  (ref) => WebViewAdapterImpl(),
);

/// ExcelTableAdapter を Provider 経由で提供
final excelTableAdapterProvider = Provider<ExcelTableAdapter>(
  (ref) => ExcelTableAdapterImpl(),
);
