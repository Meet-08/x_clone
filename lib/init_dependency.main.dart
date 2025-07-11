part of 'init_dependency.dart';

final serviceLocater = GetIt.instance;

Future<void> initDependency() async {
  _initAuth();
}

void _initAuth() {
  serviceLocater
    ..registerLazySingleton(() => const FlutterSecureStorage())
    ..registerFactory<SessionLocalDataSource>(
      () => SessionLocalDataSourceImpl(secureStorage: serviceLocater()),
    )
    ..registerFactory(
      () => UserSessionService(sessionLocalDataSource: serviceLocater()),
    )
    ..registerFactory<AuthRepository>(() => MockAuthRepository())
    ..registerFactory(() => RegisterUseCase(serviceLocater()))
    ..registerFactory(() => LoginUseCase(serviceLocater()))
    ..registerLazySingleton(
      () => RegisterBloc(
        registerUseCase: serviceLocater(),
        userSessionService: serviceLocater(),
      ),
    )
    ..registerLazySingleton(
      () => LoginBloc(
        loginUseCase: serviceLocater(),
        userSessionService: serviceLocater(),
      ),
    );
}
