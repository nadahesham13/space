import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_theme.dart';
import '../models/planet.dart';
import '../widgets/circle_arrow_button.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ScreenTwo extends StatelessWidget {
  final Planet planet;

  const ScreenTwo({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ModelViewer(
                  src: planet.modelPath,
                  alt: planet.name,
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.transparent,
                  disableZoom: true,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.black.withOpacity(0.7),
                  AppColors.black,
                ],
                stops: const [0.3, 0.6, 0.85],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(planet.title, style: AppTheme.titleLarge),
                    const SizedBox(height: 16),
                    const Text('About', style: AppTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(planet.about, style: AppTheme.bodyLarge),
                    const SizedBox(height: 16),
                    _InfoRow(
                      label: 'Distance from Sun',
                      value: planet.distanceFromSun,
                    ),
                    _InfoRow(label: 'Length of Day', value: planet.lengthOfDay),
                    _InfoRow(
                      label: 'Orbital Period',
                      value: planet.orbitalPeriod,
                    ),
                    _InfoRow(label: 'Radius', value: planet.radius),
                    _InfoRow(label: 'Mass', value: planet.mass),
                    _InfoRow(label: 'Gravity', value: planet.gravity),
                    _InfoRow(label: 'Surface Area', value: planet.surfaceArea),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.horizontalPadding),
              child: Align(
                alignment: Alignment.topLeft,
                child: CircleArrowButton(
                  icon: Icons.arrow_back,
                  size: 44,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTheme.bodyLarge),
          Text(
            value,
            style: AppTheme.bodyLarge.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}