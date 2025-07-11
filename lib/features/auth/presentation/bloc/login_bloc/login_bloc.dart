import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/core/utils.dart';
import 'package:x_clone/features/auth/domain/service/user_session_service.dart';
import 'package:x_clone/features/auth/domain/usecase/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final UserSessionService userSessionService;

  LoginBloc({required this.loginUseCase, required this.userSessionService})
    : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final token = await loginUseCase(
        email: event.email,
        password: event.password,
      );

      await userSessionService.persistToken(token: token);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(message: formateError(e)));
    }
  }
}
