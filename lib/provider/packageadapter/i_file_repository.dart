import 'package:mobile_app/model/file_template.dart';

/// ファイル関連機能のインターフェース
/// - ファイルテンプレート取得
/// - ファイル＋入力データのアップロード
/// - クラウド実装を隠蔽するための抽象層
abstract class FileRepository {
  Future<List<FileTemplate>> fetchTemplates();
  Future<void> uploadFile(Map<String, dynamic> data);
}
