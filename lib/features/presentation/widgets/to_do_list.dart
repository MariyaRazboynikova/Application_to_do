import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTasks extends StatelessWidget {
  final String taskName;
  final Function(bool?)? onChanged;
  final bool isCompleted;
  Function(BuildContext)? deleteFunction;
  // final Function()? onPressed;
  ToDoTasks({
    super.key,
    required this.taskName,
    this.onChanged,
    required this.isCompleted,
    this.deleteFunction,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskName,
                        style: GoogleFonts.farro(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey[900],
                        ),
                      ),

                      //icon delete
                      IconButton(
                        onPressed: () => deleteFunction,
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // //trailing
            // IconButton(
            //   onPressed: () => showDialog,
            //   icon: const Icon(
            //     Icons.more_vert,
            //     color: Color(0xFF00B2E7),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
