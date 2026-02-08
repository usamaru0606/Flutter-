import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/packageadapter/excel_file_service_provider.dart';
import 'package:mobile_app/provider/viewmodel/excel_table_view_provider.dart';
import '../model/excel_file.dart';

/// Excelを Table 表示する画面
/// excel_table_plus に差し替え可能
class ExcelTableView extends ConsumerWidget {
  final ExcelFile file;

  const ExcelTableView({super.key, required this.file});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ExcelTableViewProvider(
      ref.read(excelTableAdapterProvider),
    );

    final table = provider.loadTable(file.localPath);

    return Scaffold(
      appBar: AppBar(title: Text(file.name)),
      body: ListView(
        children: table.map((row) {
          return Row(
            children: row
                .map(
                  (cell) => Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Text(cell),
                    ),
                  ),
                )
                .toList(),
          );
        }).toList(),
      ),
    );
  }
}
