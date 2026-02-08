/// Excelの表示方法を切り替えるためのenum
enum ExcelDisplayMode { webView, table }

/// Excelファイルを表すドメインモデル
/// - file_picker で取得したローカルパスを保持
/// - 表示方式（WebView / Table）を保持
class ExcelFile {
  final String id;
  final String name;
  final String localPath;
  final ExcelDisplayMode displayMode;

  ExcelFile({
    required this.id,
    required this.name,
    required this.localPath,
    required this.displayMode,
  });

  /// 表示モードだけを変更した新しいインスタンスを返す
  ExcelFile copyWith({ExcelDisplayMode? displayMode}) {
    return ExcelFile(
      id: id,
      name: name,
      localPath: localPath,
      displayMode: displayMode ?? this.displayMode,
    );
  }
}
