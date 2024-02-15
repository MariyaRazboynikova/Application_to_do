import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onTap;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey[700],
        ),
        title: Text(
          text,
          style: GoogleFonts.farro(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.grey[700],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
