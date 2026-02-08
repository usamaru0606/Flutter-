import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/file_list_view.dart';

/// アプリのエントリーポイント
/// Riverpod をアプリ全体で使えるよう ProviderScope でラップ
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

/// アプリのルートWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FileListView());
  }
}
