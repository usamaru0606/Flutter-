import 'package:mobile_app/provider/packageadapter/excel_table_adapter.dart';

/// ExcelTable表示用の ViewProvider
class ExcelTableViewProvider {
  final ExcelTableAdapter adapter;

  ExcelTableViewProvider(this.adapter);

  List<List<String>> loadTable(String path) {
    return adapter.loadTable(path);
  }
}
