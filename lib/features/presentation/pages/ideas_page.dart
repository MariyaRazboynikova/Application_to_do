import 'package:app_to_do/features/presentation/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IdeasPage extends StatefulWidget {
  const IdeasPage({super.key});

  @override
  State<IdeasPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<IdeasPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //
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
                  "Welcome to your ideas",
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
                'assets/ideas.png',
              ),
            ),

            //dewider
          ],
        ),
        drawer: const MyDrawer(),

        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "My Ideas",
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
      ),
    ));
  }
}
