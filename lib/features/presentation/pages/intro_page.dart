import 'dart:math';

import 'package:app_to_do/features/presentation/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF00B2E7),
            Color(0xFFE064F7),
            Color(0xFFFF8D6C),
          ],
          transform: GradientRotation(pi / 4),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            Image.asset('assets/intro.png'),

            const SizedBox(height: 50),

            Container(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(children: [
                  //title
                  Text(
                    "Work on time",
                    style: GoogleFonts.damion(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.grey[900],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //subtitle
                  Text(
                    "Use a to-do list to make the most of your time and accomplish more.",
                    style: GoogleFonts.damion(
                      fontWeight: FontWeight.w400,
                      fontSize: 50,
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //buttom
                  MyButton(
                    onTap: () => Navigator.pushNamed(context, '/tasks_page'),
                    child: const Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
