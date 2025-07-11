import 'package:x_clone/features/auth/data/datasources/session_local_data_source.dart';

class UserSessionService {
  SessionLocalDataSource sessionLocalDataSource;

  UserSessionService({required this.sessionLocalDataSource});

  Future<void> persistToken({required String token}) async {
    await sessionLocalDataSource.saveToken(token: token);
  }

  Future<String?> getUserSession() async {
    return await sessionLocalDataSource.getTotken();
  }

  Future<void> logout() async {
    await sessionLocalDataSource.deleteToken();
  }

  Future<bool> isLoggedIn() async {
    final token = await sessionLocalDataSource.getTotken();
    return token != null && token.isNotEmpty;
  }
}
