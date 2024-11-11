import 'package:flutter/material.dart';

class BorderBeam extends StatelessWidget {
  final Duration duration; // Duration type
  final Color colorFrom;
  final Color colorTo;
  final Color staticBorderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;

  const BorderBeam({
    Key? key,
    required this.duration,
    required this.colorFrom,
    required this.colorTo,
    required this.staticBorderColor,
    required this.borderRadius,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration, // Ensure that `duration` is a Duration object
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          color: staticBorderColor,
        ),
      ),
      padding: padding,
      child: child,
    );
  }
}
