import 'package:file_picker/file_picker.dart';

/// Excelファイルの取得に関する責務を持つService
/// 今回は API を使わず、端末からファイルを選択する
class ExcelFileService {
  /// file_picker を使って Excel ファイルを選択する
  /// - キャンセル時は null を返す
  Future<String?> pickExcelFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls', 'html'],
    );

    if (result == null) return null;

    return result.files.single.path;
  }
}
