import 'package:app_to_do/features/presentation/cotroller/task_controller.dart';
import 'package:app_to_do/features/presentation/widgets/add_task.dart';
import 'package:app_to_do/features/presentation/widgets/my_drawer.dart';
import 'package:app_to_do/features/presentation/widgets/to_do_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  //список задач
  List toDoList = [
    ["Make tutorial", 'Выполнить до: ', false],
    ["Do exercise", 'Выполнить до: ', false],
  ];



  //chekbox was tapped
  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][2] = !toDoList[index][2];
    });
  }

  void crateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return const AddTask(
          controller: ,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Center(
              child: Column(
                children: [
                  //title
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      "Hi Mary",
                      style: GoogleFonts.farro(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey[900],
                      ),
                    ),
                  ),

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
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
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

              //список
              Expanded(
                child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoTasks(
                      taskName: toDoList[index][0],
                      date: toDoList[index][1],
                      isCompleted: toDoList[index][2],
                      onChanged: (value) => checkboxChanged(value, index),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFE064F7),
            onPressed: crateNewTask,
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
