import 'package:mobile_app/provider/packageadapter/package_di_provider.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

/// 認証状態
/// - ログイン済みかどうかを管理
class AuthState {
  final bool isLoggedIn;

  AuthState({required this.isLoggedIn});

  factory AuthState.initial() => AuthState(isLoggedIn: false);
}

/// 認証処理を担当する Notifier
/// - Repository を利用してログイン
/// - 認証結果を State に反映
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(AuthState.initial());

  final Ref ref;

  Future<void> login(String id, String password) async {
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(id, password);
    state = AuthState(isLoggedIn: result);
  }
}

/// AuthNotifier Provider
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref),
);
