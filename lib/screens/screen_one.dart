import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/planet.dart';
import '../widgets/circle_arrow_button.dart';
import '../widgets/red_pill_button.dart';
import 'screen_two.dart';
import '../core/app_colors.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToPage(int index) {
    if (index < 0 || index >= planets.length) return;
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planet = planets[_currentIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.horizontalPadding,
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // العنوان
              const Text('Explore', style: AppTheme.titleLarge),
              const SizedBox(height: 8),
              const Text(
                'Which planet\nwould you like to explore?',
                textAlign: TextAlign.center,
                style: AppTheme.bodyLarge,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: planets.length,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Image.asset(planets[index].imagePath),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 64,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: planets.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final isSelected = index == _currentIndex;
                    return GestureDetector(
                      onTap: () => _goToPage(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 56,
                        height: 56,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.red
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Image.asset(planets[index].imagePath),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleArrowButton(
                    icon: Icons.arrow_back,
                    size: 48,
                    onPressed: () => _goToPage(_currentIndex - 1),
                  ),
                  Text(planet.name, style: AppTheme.titleLarge),
                  CircleArrowButton(
                    icon: Icons.arrow_forward,
                    size: 48,
                    onPressed: () => _goToPage(_currentIndex + 1),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              RedPillButton(
                title: 'Explore ${planet.name}',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ScreenTwo(planet: planet),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}