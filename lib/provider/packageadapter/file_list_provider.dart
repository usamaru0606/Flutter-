import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_app/model/excel_file.dart';
import 'package:mobile_app/service/excel_file_service.dart';
import 'excel_file_service_provider.dart';

/// Excelファイル一覧の状態を管理する StateNotifier
final fileListProvider =
    StateNotifierProvider<FileListNotifier, List<ExcelFile>>(
      (ref) => FileListNotifier(ref.read(excelFileServiceProvider)),
    );

class FileListNotifier extends StateNotifier<List<ExcelFile>> {
  final ExcelFileService service;

  FileListNotifier(this.service) : super([]);

  /// Excelファイルを追加する（file_picker）
  Future<void> addExcelFile() async {
    final path = await service.pickExcelFile();
    if (path == null) return;

    final name = path.split('/').last;

    state = [
      ...state,
      ExcelFile(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        localPath: path,
        displayMode: ExcelDisplayMode.webView,
      ),
    ];
  }

  /// 表示方式を切り替える
  void changeDisplayMode(String id, ExcelDisplayMode mode) {
    state = [
      for (final file in state)
        if (file.id == id) file.copyWith(displayMode: mode) else file,
    ];
  }
}
