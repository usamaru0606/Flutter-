import 'package:mobile_app/provider/packageadapter/i_auth_repository.dart';

/// 認証機能の Mock 実装
/// - Azure AD / B2C を想定
/// - 開発・検証用にローカルで完結
/// - 本番では AzureAuthService に差し替える
class MockAuthService implements AuthRepository {
  @override
  Future<bool> login(String id, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return id == 'test' && password == 'test';
  }
}
