import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';

class RedPillButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const RedPillButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        child: Text(
          title,
          style: AppTheme.titleLarge.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}