import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CircleArrowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double size;

  const CircleArrowButton({
    super.key,
    required this.onPressed,
    this.icon = Icons.arrow_forward,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
          elevation: 6,
        ),
        child: Icon(icon),
      ),
    );
  }
}