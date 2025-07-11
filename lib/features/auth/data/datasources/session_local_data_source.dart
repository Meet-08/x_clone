import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract interface class SessionLocalDataSource {
  Future<void> saveToken({required String token});
  Future<String?> getTotken();
  Future<void> deleteToken();
}

class SessionLocalDataSourceImpl implements SessionLocalDataSource {
  final FlutterSecureStorage secureStorage;
  static const _keyToken = "auth_token";

  SessionLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<String?> getTotken() async {
    final token = await secureStorage.read(key: _keyToken);

    return token;
  }

  @override
  Future<void> saveToken({required String token}) async {
    await secureStorage.write(key: _keyToken, value: token);
  }

  @override
  Future<void> deleteToken() async {
    await secureStorage.delete(key: _keyToken);
  }
}
