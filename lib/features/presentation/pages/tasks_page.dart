import 'package:app_to_do/features/presentation/widgets/my_drawer.dart';
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
        child: MaterialApp(
      home: Scaffold(
        //
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //title
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  "Hi Mary",
                  style: GoogleFonts.farro(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey[900],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //subtitle
              Text(
                "Welcome to To do",
                style: GoogleFonts.farro(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          actions: [
            //person
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                'assets/man.png',
              ),
            ),

            //dewider
          ],
        ),
        drawer: const MyDrawer(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My tasks",
              style: GoogleFonts.farro(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
