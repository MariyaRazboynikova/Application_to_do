import 'dart:math';

import 'package:app_to_do/features/presentation/pages/ideas_page.dart';
import 'package:app_to_do/features/presentation/pages/tasks_page.dart';
import 'package:app_to_do/features/presentation/widgets/add_task.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unSelectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: index == 0 ? selectedItem : unSelectedItem,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_graph,
                color: index == 1 ? selectedItem : unSelectedItem,
              ),
              label: 'Stats',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => const AddTask()),
          );
        },
        shape: const CircleBorder(),
        child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00B2E7),
                  Color(0xFFE064F7),
                  Color(0xFFFF8D6C),
                ],
                transform: GradientRotation(pi / 4),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
      ),
      body: index == 0 ? const TaskPage() : const IdeasPage(),
    );
  }
}
