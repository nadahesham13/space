import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/circle_arrow_button.dart';
import 'screen_one.dart';

class ScreenZero extends StatelessWidget {
  const ScreenZero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.45,
            top: 0,
            bottom: 0,
            child: Center(
              child: Image.asset(
                'assets/images/earth.png',
                width: MediaQuery.of(context).size.width * 1.4,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: AppTheme.horizontalPadding,
            top: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore\nThe\nUniverse',
                style: AppTheme.titleLarge.copyWith(
                  fontSize: 40,
                  height: 1.1,
                ),
              ),
            ),
          ),
          Positioned(
            right: AppTheme.horizontalPadding,
            bottom: 32,
            child: CircleArrowButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ScreenOne()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}