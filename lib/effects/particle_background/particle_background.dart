// particle_background.dart
import 'package:flutter/material.dart';
import 'particle_text.dart';

class ParticleBackground extends StatefulWidget {
  const ParticleBackground({Key? key}) : super(key: key);

  @override
  _ParticleBackgroundState createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground> {
  Color particleColor = Colors.white;
  bool isDarkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateThemeColor();
  }

  void _updateThemeColor() {
    final brightness = Theme.of(context).brightness;
    setState(() {
      isDarkMode = brightness == Brightness.dark;
      particleColor = isDarkMode ? Colors.white : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            Positioned.fill(
              child: Particles(
                quantity: 100, // Number of particles
                ease: 80, // Particle ease speed
                color: particleColor, // Dynamic color based on theme
                key: ValueKey(particleColor), // Rebuild when color changes
              ),
            ),
          ],
        ),
      ),
    );
  }
}
