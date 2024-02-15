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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //image
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('assets/intro.png'),
              ),
            ),

            const SizedBox(height: 50),

            SizedBox(
              height: 350,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Column(children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      "Work on time",
                      style: GoogleFonts.farro(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //subtitle
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        "Use a to-do list to make the most of your time and accomplish more.",
                        style: GoogleFonts.farro(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  //buttom
                  MyButton(
                    onTap: () => Navigator.pushNamed(context, '/tasks_page'),
                    child: const Icon(
                      Icons.task_alt_rounded,
                      color: Colors.white,
                      size: 50,
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
