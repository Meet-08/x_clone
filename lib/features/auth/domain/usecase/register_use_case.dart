import 'package:x_clone/features/auth/domain/entities/user_entity.dart';
import 'package:x_clone/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<String> call({
    required String email,
    required String username,
    required String password,
  }) async {
    final user = UserEntity(
      email: email,
      username: username,
      password: password,
    );

    final token = await authRepository.register(user);
    return token;
  }
}
