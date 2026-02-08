import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_app/model/file_template.dart';
import 'package:mobile_app/provider/packageadapter/package_di_provider.dart';
import 'package:mobile_app/provider/viewmodel/file_list_provider.dart';

/// ファイル記録状態
class FileRecordState {
  final Map<String, String> values;
  final bool isUploading;

  FileRecordState({required this.values, required this.isUploading});

  bool get isComplete => values.values.every((v) => v.isNotEmpty);

  factory FileRecordState.initial(FileTemplate template) {
    return FileRecordState(
      values: {for (final item in template.items) item: ''},
      isUploading: false,
    );
  }
}

/// ファイル記録 Notifier
class FileRecordNotifier extends StateNotifier<FileRecordState> {
  FileRecordNotifier(this.ref, FileTemplate template)
    : super(FileRecordState.initial(template));

  final Ref ref;

  void update(String key, String value) {
    state = FileRecordState(
      values: {...state.values, key: value},
      isUploading: state.isUploading,
    );
  }

  Future<void> upload(String templateName) async {
    if (!state.isComplete) return;

    state = FileRecordState(values: state.values, isUploading: true);

    final repo = ref.read(fileRepositoryProvider);
    await repo.uploadFile({'template': templateName, 'data': state.values});

    state = FileRecordState(values: state.values, isUploading: false);
  }
}

final fileListNotifierProvider =
    StateNotifierProvider<FileListNotifier, FileListState>(
      (ref) => FileListNotifier(ref),
    );
