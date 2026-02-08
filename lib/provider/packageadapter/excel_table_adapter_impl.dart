import 'excel_table_adapter.dart';

/// excel_table_plus を使う想定の実装
/// 今回はデバッグ用にダミーデータを返す
class ExcelTableAdapterImpl implements ExcelTableAdapter {
  @override
  List<List<String>> loadTable(String path) {
    return [
      ['設備名', '状態', '備考'],
      ['ポンプA', 'OK', ''],
      ['ポンプB', 'NG', '異音あり'],
    ];
  }
}
