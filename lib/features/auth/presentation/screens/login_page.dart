import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/core/theme/app_palette.dart';
import 'package:x_clone/core/utils.dart';
import 'package:x_clone/core/widgets/loader.dart';
import 'package:x_clone/features/auth/presentation/bloc/login_bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLoginPressed() {
    context.read<LoginBloc>().add(
      LoginSubmitted(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacementNamed(context, "/home");
            }

            if (state is LoginFailure) {
              showSnackBar(context, state.message);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 4,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _onLoginPressed,
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppPalette.extraLightGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (state is LoginFailure)
                    Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/register"),
                    child: const Text(
                      "Don't have an account? Register here",
                      style: TextStyle(color: AppPalette.blue),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
