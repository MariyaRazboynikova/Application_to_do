import 'package:app_to_do/features/data/models/database.dart';
import 'package:app_to_do/features/presentation/widgets/add_task.dart';
import 'package:app_to_do/features/presentation/widgets/my_drawer.dart';
import 'package:app_to_do/features/presentation/widgets/to_do_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _controller = TextEditingController();

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void removeTask(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Удалить эту задачу?"),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);
              // delete task
              setState(() {
                db.toDoList.removeAt(index);
              });
              db.updateDataBase();
            },
            child: const Text('Да'),
          ),
        ],
      ),
    );
    db.updateDataBase();
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
                  itemCount: db.toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoTasks(
                      taskName: db.toDoList[index][0],
                      isCompleted: db.toDoList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index),
                      onPressed: () => removeTask(index),
                    );
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFE064F7),
            onPressed: createNewTask,
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
