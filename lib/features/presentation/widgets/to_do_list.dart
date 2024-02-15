import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTasks extends StatelessWidget {
  final String taskName;
  final String date;
  final Function(bool?)? onChanged;
  final bool isCompleted;
  final Function()? onPressed;
  const ToDoTasks(
      {super.key,
      required this.taskName,
      required this.date,
      this.onChanged,
      required this.isCompleted,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //чекбокс
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
            ),

            //Задача и срок
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: GoogleFonts.daiBannaSil(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    "Выполнить до: $date",
                    style: GoogleFonts.farro(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            //trailing
            IconButton(
              onPressed: () => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: const Text('Confirm'),
                content:
                    const Text('Are you sure you wish to delete this task?'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No'),
                  ),
                ],
              ),
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFF00B2E7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
