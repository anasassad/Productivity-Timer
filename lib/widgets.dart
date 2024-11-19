import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final VoidCallback onPressed;

  const ProductivityButton(
      {super.key,
      required this.color,
      required this.text,
      required this.onPressed,
      this.size = 150.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final Color color;
  final String text;
  final int value;

  const SettingsButton(this.color, this.text, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {},
        color: color,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
