import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'screens/screen_zero.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const ScreenZero(),
    );
  }
}