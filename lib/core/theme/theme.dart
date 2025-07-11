import 'package:flutter/material.dart';
import 'package:x_clone/core/theme/app_palette.dart';

class AppTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppPalette.blue,
      surface: AppPalette.black,
    ),

    scaffoldBackgroundColor: AppPalette.black,

    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppPalette.blue),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 16)),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 12)),
      ),
    ),
  );
}
