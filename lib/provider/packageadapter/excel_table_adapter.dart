/// excel_table_plus 等を使って
/// Excel を「表データ」として扱うための Adapter interface
abstract class ExcelTableAdapter {
  List<List<String>> loadTable(String path);
}
