import 'package:x_clone/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<String> call({required String email, required String password}) async {
    final params = LoginParams(email: email, password: password);
    final token = await authRepository.login(params);
    return token;
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password}) {
    if (email.isEmpty || !email.trim().contains('@')) {
      throw Exception('Email cannot be empty or must be a valid email');
    }
    if (password.length < 4) {
      throw Exception('Password cannot be less than 4 characters');
    }
  }
}
