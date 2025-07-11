import 'package:flutter/material.dart';
import 'package:x_clone/core/widgets/loader.dart';
import 'package:x_clone/features/auth/domain/service/user_session_service.dart';

class Splash extends StatefulWidget {
  final UserSessionService sessionService;
  const Splash({super.key, required this.sessionService});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkSession();
    super.initState();
  }

  Future<void> _checkSession() async {
    final isLogggedIn = await widget.sessionService.isLoggedIn();
    if (!mounted) return;

    if (isLogggedIn) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Loader());
  }
}
