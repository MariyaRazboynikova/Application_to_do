import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //appbar with person
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //greetings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              )

              //person
            ],
          )

          //title

          //tasks list

          //downbar
        ],
      ),
    );
  }
}
