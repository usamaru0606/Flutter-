import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:mobile_app/provider/packageadapter/package_di_provider.dart';

import '../../model/file_template.dart';

/// ファイル一覧状態
class FileListState {
  final List<FileTemplate> templates;

  FileListState({required this.templates});

  factory FileListState.initial() => FileListState(templates: []);
}

/// ファイル一覧用 Notifier
class FileListNotifier extends StateNotifier<FileListState> {
  FileListNotifier(this.ref) : super(FileListState.initial());

  final Ref ref;

  Future<void> load() async {
    final repo = ref.read(fileRepositoryProvider);
    final list = await repo.fetchTemplates();
    state = FileListState(templates: list);
  }
}
