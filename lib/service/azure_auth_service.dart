import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:mobile_app/provider/packageadapter/i_auth_repository.dart';

/// Azure Functions + Azure AD を想定した認証Service
/// Azure Functions + Azure AD を利用した認証Service
/// - REST API 経由でログイン処理を実施
/// - Token 発行を想定
/// - AuthRepository の本番実装
class AzureAuthService implements AuthRepository {
  final String endpoint;

  AzureAuthService(this.endpoint);

  @override
  Future<bool> login(String id, String password) async {
    final res = await http.post(
      Uri.parse('$endpoint/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'password': password}),
    );

    return res.statusCode == 200;
  }
}
