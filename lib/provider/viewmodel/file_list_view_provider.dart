import 'package:mobile_app/model/excel_file.dart';

/// FileListView 用のロジッククラス
/// 今回は StateNotifier を直接使うため最小構成
class FileListViewProvider {
  const FileListViewProvider();

  /// 一覧表示用のラベル生成などをここに集約できる
  String displayModeLabel(ExcelDisplayMode mode) {
    return mode == ExcelDisplayMode.webView ? 'WebView' : 'Table';
  }
}
