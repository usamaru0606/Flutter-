import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/packageadapter/i_auth_repository.dart';
import 'package:mobile_app/provider/packageadapter/i_file_repository.dart';
import 'mock/mock_auth_service.dart';
import 'mock/mock_file_service.dart';

/// 認証 Repository Provider
/// - Mock / Azure 実装の差し替えポイント
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return MockAuthService();
});

/// ファイル Repository Provider
/// - ファイル取得 / アップロードを提供
final fileRepositoryProvider = Provider<FileRepository>((ref) {
  return MockFileService();
});
