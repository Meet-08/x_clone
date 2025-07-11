import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:x_clone/core/utils.dart';
import 'package:x_clone/features/auth/domain/service/user_session_service.dart';
import 'package:x_clone/features/auth/domain/usecase/register_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final UserSessionService userSessionService;
  RegisterBloc({
    required this.registerUseCase,
    required this.userSessionService,
  }) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    try {
      final token = await registerUseCase(
        email: event.email,
        password: event.password,
        username: event.username,
      );
      await userSessionService.persistToken(token: token);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(message: formateError(e)));
    }
  }
}
