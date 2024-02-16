import 'package:app_to_do/features/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[100],
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                Button(text: "Save", onPressed: onSave),

                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class AddTask extends StatefulWidget {
//   final controller;
//   VoidCallback onSave;

//   AddTask({
//     super.key,
//     required this.controller,
//     required this.onSave,
//   });

//   @override
//   State<AddTask> createState() => _AddTaskState();
// }

// class _AddTaskState extends State<AddTask> {
//   @override
//   TextEditingController taskController = TextEditingController();

//   TextEditingController dateController = TextEditingController();

//   DateTime selectDate = DateTime.now();

//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.pink[100],
//       content: Container(
//         height: 300,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             // get user input
//             TextField(
//               controller: widget.controller,
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                 hintText: "Add a new task",
//               ),
//             ),

//             //тестовое поле с календарем
//             TextFormField(
//               controller: dateController,
//               textAlignVertical: TextAlignVertical.center,
//               readOnly: true,
//               onTap: () async {
//                 //календарь
//                 DateTime? newData = await showDatePicker(
//                   context: context,
//                   initialDate: selectDate,
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add(
//                     const Duration(days: 365),
//                   ),
//                 );
//                 if (newData != null) {
//                   setState(() {
//                     dateController.text =
//                         DateFormat('dd/MM/yyyy').format(newData);
//                     selectDate = newData;
//                   });
//                 }
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 prefix: Icon(
//                   Icons.lock_clock,
//                   size: 16,
//                   color: Colors.grey[500],
//                 ),
//                 label: const Text("Выполнить до: "),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     borderSide: BorderSide.none),
//               ),
//             ),

//             const SizedBox(height: 16)

//             Button(text: 'Save', onPressed: onSave),

//             // buttons -> save + cancel
//             Container(
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black),
//                   borderRadius: BorderRadius.circular(20)),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: kToolbarHeight,
//                 child: TextButton(
//                   onPressed: onSave,
//                   style: TextButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       )),
//                   child: const Text(
//                     'Save',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
