import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/core/theme/theme.dart';
import 'package:x_clone/core/widgets/home_page.dart';
import 'package:x_clone/core/widgets/splash.dart';
import 'package:x_clone/features/auth/domain/service/user_session_service.dart';
import 'package:x_clone/features/auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:x_clone/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:x_clone/features/auth/presentation/screens/login_page.dart';
import 'package:x_clone/features/auth/presentation/screens/register_page.dart';
import 'package:x_clone/init_dependency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocater<RegisterBloc>()),
        BlocProvider(create: (_) => serviceLocater<LoginBloc>()),
      ],
      child: MaterialApp(
        title: 'x_clone',
        theme: AppTheme.darkTheme,
        home: Splash(sessionService: serviceLocater<UserSessionService>()),
        routes: {
          "/login": (context) => const LoginPage(),
          "/register": (context) => const RegisterPage(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}
