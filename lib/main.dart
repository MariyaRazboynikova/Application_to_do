import 'package:app_to_do/features/presentation/pages/ideas_page.dart';
import 'package:app_to_do/features/presentation/pages/intro_page.dart';
import 'package:app_to_do/features/presentation/pages/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //init have
  await Hive.initFlutter();

  //open a box
  var box = Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/tasks_page': (context) => const TaskPage(),
        '/ideas_page': (context) => const IdeasPage(),
      },
    );
  }
}
