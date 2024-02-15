import 'package:app_to_do/features/presentation/cotroller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  final controller; //
  const AddTask({super.key, required this.controller});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //
      width: 120, //
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.pink[100],
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add Task',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: MediaQuery.of(context).size.width,

                  //тектовое поле
                  child: TextFormField(
                    controller: controller,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'Task name',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                //тестовое поле с календарем
                TextFormField(
                  controller: dateController,
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  onTap: () async {
                    //календарь
                    DateTime? newData = await showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                    );
                    if (newData != null) {
                      setState(() {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(newData);
                        selectDate = newData;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefix: Icon(
                      Icons.lock_clock,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    label: const Text("Выполнить до: "),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                  ),
                ),

                const SizedBox(height: 16),

                //кнопка сохранения
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  child: SizedBox(
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
