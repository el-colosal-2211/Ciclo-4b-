import 'package:flutter/material.dart';

class IconoAtras extends StatelessWidget {
  final VoidCallback onPressed;
  const IconoAtras({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_circle_left_outlined,
        size: 55,
        color: Colors.white70,
      ),
    );
  }
}
