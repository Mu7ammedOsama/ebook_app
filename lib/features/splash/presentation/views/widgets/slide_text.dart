import 'package:flutter/material.dart';

class SlideText extends StatelessWidget {
  const SlideText({super.key, required this.slideAnimation});

  final Animation<Offset> slideAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slideAnimation,
          child: const Text(
            'Read Free Book',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
