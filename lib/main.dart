import 'package:app_to_do/features/presentation/pages/intro_page.dart';
import 'package:app_to_do/features/presentation/pages/tasks_page.dart';
import 'package:flutter/material.dart';

void main() {
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
      },
    );
  }
}
