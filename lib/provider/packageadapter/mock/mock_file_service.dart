import 'package:mobile_app/model/file_template.dart';
import 'package:mobile_app/provider/packageadapter/i_file_repository.dart';

/// ファイル機能の Mock 実装
/// - Azure Functions / Blob Storage を想定
/// - テンプレート取得・アップロードを擬似的に再現
/// - UI / VM 開発を先行させるための実装
class MockFileService implements FileRepository {
  @override
  Future<List<FileTemplate>> fetchTemplates() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      FileTemplate(name: '点検シートA', items: ['温度', '圧力', '電圧']),
    ];
  }

  @override
  Future<void> uploadFile(Map<String, dynamic> data) async {
    await Future.delayed(Duration(seconds: 1));
    print('Upload mock: $data');
  }
}
