import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CCApp());
}

class CCApp extends StatelessWidget {
  const CCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Color Changer",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _StateHomePage();
}

class _StateHomePage extends State<HomePage> {
  // Data right here
  Color ledColor = Colors.white;

  void changeColorRed() {
    setState(() {
      ledColor = Colors.red;
    });
  }
  void changeColorBlue() {
    setState(() {
      ledColor = Colors.blue;
    });
  }
  void changeColorGreen() {
    setState(() {
      ledColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text(
          "Change LED Color",
          style: GoogleFonts.pressStart2p(
            fontSize: 15,
            color: ledColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            onPressed: () => print("Pressed Settings"),
            icon: Icon(
              Icons.settings,
              color: ledColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\"Light Bulb\"",
              style: GoogleFonts.pressStart2p(
                fontSize: 20,
                color: ledColor,
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 150,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: 110,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(width: 5),
                      shape: BoxShape.rectangle,
                      color: ledColor,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 270,
                  decoration: BoxDecoration(
                    border: Border.all(width: 5),
                    shape: BoxShape.circle,
                    color: ledColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centra il pulsante
              children: [
                //buttons
                FloatingActionButton.extended(
                  onPressed: changeColorRed,
                  backgroundColor: Colors.black12,
                  label: Text(
                    "Turn Red",
                    style: GoogleFonts.pressStart2p(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
                //buttons
                FloatingActionButton.extended(
                  onPressed: changeColorBlue,
                  backgroundColor: Colors.black12,
                  label: Text(
                    "Turn Blue",
                    style: GoogleFonts.pressStart2p(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),   //buttons
                FloatingActionButton.extended(
                  onPressed: changeColorGreen,
                  backgroundColor: Colors.black12,
                  label: Text(
                    "Turn Green",
                    style: GoogleFonts.pressStart2p(
                      fontSize: 18,
                      color: Colors.green,
                    ),
                  ),
                ),


          ],
        ),
      ),
    );
  }
}