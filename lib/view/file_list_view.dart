import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/packageadapter/file_list_provider.dart';
import '../model/excel_file.dart';
import 'excel_webview_view.dart';
import 'excel_table_view.dart';

/// Excelファイル一覧画面
/// - ファイル追加
/// - 表示方式切替
/// - 表示画面への遷移
class FileListView extends ConsumerWidget {
  const FileListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final files = ref.watch(fileListProvider);
    final notifier = ref.read(fileListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Excel一覧'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: notifier.addExcelFile,
          ),
        ],
      ),
      body: ListView(
        children: files.map((file) {
          return ListTile(
            title: Text(file.name),
            subtitle: DropdownButton<ExcelDisplayMode>(
              value: file.displayMode,
              items: const [
                DropdownMenuItem(
                  value: ExcelDisplayMode.webView,
                  child: Text('WebView'),
                ),
                DropdownMenuItem(
                  value: ExcelDisplayMode.table,
                  child: Text('Table'),
                ),
              ],
              onChanged: (mode) {
                notifier.changeDisplayMode(file.id, mode!);
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.open_in_new),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => file.displayMode == ExcelDisplayMode.webView
                        ? ExcelWebView(file: file)
                        : ExcelTableView(file: file),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
