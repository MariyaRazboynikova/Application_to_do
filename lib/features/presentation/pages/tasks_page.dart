import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  int index = 0;
  late Color selectedItem = Colors.green;
  Color unSelectedItem = Colors.grey;

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
                    "Hi Mary",
                    style: GoogleFonts.damion(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //subtitle
                  Text(
                    "Welcome to To do",
                    style: GoogleFonts.damion(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),

              //person
              Image.asset('assets/man.png'),
            ],
          ),

          //title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My tasks",
                style: GoogleFonts.damion(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),

          //tasks list
          // ListView.builder(itemBuilder: itemBuilder,),
        ],
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget {
  final Color color;
  final Widget child;
  const BottomAppBar({super.key, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: bottomAppBarContents,
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null),
    );
  }
}
