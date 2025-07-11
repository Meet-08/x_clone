import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_clone/core/theme/app_palette.dart';
import 'package:x_clone/core/widgets/loader.dart';
import 'package:x_clone/features/auth/presentation/bloc/register_bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onRegisterPressed() {
    context.read<RegisterBloc>().add(
      RegisterSubmitted(
        email: _emailController.text.trim(),
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Loader();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _onRegisterPressed,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: AppPalette.extraLightGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (state is RegisterFailure)
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),

                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/login"),
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(color: AppPalette.blue),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
