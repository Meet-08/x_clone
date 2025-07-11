import 'package:x_clone/features/auth/domain/entities/user_entity.dart';
import 'package:x_clone/features/auth/domain/usecase/login_use_case.dart';

abstract interface class AuthRepository {
  Future<String> register(UserEntity user);
  Future<String> login(LoginParams params);
}
