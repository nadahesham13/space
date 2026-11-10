import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static const double horizontalPadding = 16;

  static const titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(primary: AppColors.red),
    textTheme: const TextTheme(
      titleLarge: titleLarge,
      bodyLarge: bodyLarge,
    ),
  );
}