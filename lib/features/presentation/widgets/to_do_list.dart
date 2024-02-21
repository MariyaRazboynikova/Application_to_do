import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTasks extends StatelessWidget {
  final String taskName;
  final Function(bool?)? onChanged;
  final bool isCompleted;
  final Function()? onPressed;
  // final Function()? onPressed;
  ToDoTasks({
    super.key,
    required this.taskName,
    this.onChanged,
    required this.isCompleted,
    required this.onPressed,
    // this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //чекбокс
            Row(
              children: [
                Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: const Color(0xFFE064F7),
                ),

                const SizedBox(width: 10),

                //Задача и срок

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 250,
                    height: 50,
                    child: Text(
                      taskName,
                      style: GoogleFonts.farro(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //icon delete
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
