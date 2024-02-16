import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey[200],
      child: Text(
        text,
        style: GoogleFonts.farro(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
