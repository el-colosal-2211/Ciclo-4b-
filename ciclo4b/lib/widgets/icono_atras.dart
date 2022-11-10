import 'package:flutter/material.dart';

class IconoAtras extends StatelessWidget {
  const IconoAtras({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() => Navigator.pop(context)),
      icon: const Icon(
        Icons.arrow_circle_left_outlined,
        size: 55,
        color: Colors.white70,
      ),
    );
  }
}
