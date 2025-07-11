import 'package:x_clone/features/auth/domain/entities/user_entity.dart';
import 'package:x_clone/features/auth/domain/repository/auth_repository.dart';
import 'package:x_clone/features/auth/domain/usecase/login_use_case.dart';

class MockAuthRepository implements AuthRepository {
  @override
  Future<String> register(UserEntity user) async {
    return "token";
  }

  @override
  Future<String> login(LoginParams params) async {
    return "token";
  }
}
