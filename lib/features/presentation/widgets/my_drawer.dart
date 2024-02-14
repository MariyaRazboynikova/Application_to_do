import 'package:app_to_do/features/data/models/drawer_my_list.dart';
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
                    Icons.ramen_dining,
                    size: 72,
                    color: Color(0xFF00B2E7),
                  ),
                ),
              ),

              const SizedBox(height: 5),

              //shop title
              MyListTile(
                text: "Tasks",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart title
              MyListTile(
                text: "Ideas",
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);

                  //go to cart page
                  Navigator.pushNamed(context, '/ideas_page');
                },
              ),
              // MyListTile(
              //   text: "Settings",
              //   icon: Icons.settings,
              //   onTap: () {
              //     //pop drawer first
              //     Navigator.pop(context);

              //     //go to cart page
              //     Navigator.pushNamed(context, '/settings_page');
              //   },
              // ),
            ],
          ),

          //exit shop title
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
