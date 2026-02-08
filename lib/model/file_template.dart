/// ファイルテンプレートの Model
/// - クラウドから取得される定義データ
/// - point / item は固定
/// - data は入力画面で紐づけられる
class FileTemplate {
  final String name;
  final List<String> items;

  FileTemplate({required this.name, required this.items});
}
