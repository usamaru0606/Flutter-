/// 認証機能のインターフェース
/// - ログイン処理の抽象定義
/// - View / VM はこのインターフェースのみを参照する
/// - Mock / Azure 実装の差し替え点
abstract class AuthRepository {
  Future<bool> login(String id, String password);
}
