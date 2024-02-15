import 'package:app_to_do/features/data/models/drawer_my_list.dart';
import 'package:app_to_do/features/presentation/pages/ideas_page.dart';
import 'package:app_to_do/features/presentation/pages/tasks_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header logo
              const DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.note_alt_rounded,
                    size: 72,
                    color: Color(0xFF00B2E7),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              //task title
              MyListTile(
                text: "Tasks",
                icon: Icons.note_add_outlined,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);

                  //go to ideas page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const TaskPage();
                      },
                    ),
                  );
                },
              ),

              //ideas title
              MyListTile(
                text: "Ideas",
                icon: Icons.star_border_sharp,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);

                  //go to ideas page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const IdeasPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
