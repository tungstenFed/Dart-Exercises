import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'globals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Jeje',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key});

  State<MyHomePage> createState() => _StateMyHomePage();
}
class JejePage extends StatefulWidget
{
   const JejePage({super.key});

  State<JejePage> createState() => _StateJejePage();
}

class _StateMyHomePage extends State<MyHomePage>
{
  String inputUsername = "";
  String inputPassword = "";

  void checkCredentials()
  {
    if(inputPassword == "jejelovesmatti")
    {
      print("pass ok");
      Navigator.push( //push on top e background c'è login page
        //pag iniziale
        context,
        //destinazione + materialpageRoute fa slide animation su android
        MaterialPageRoute(builder: (BuildContext context) => JejePage())

          //you can also go back as it creates a button automatically to go back
      );
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey,
        toolbarHeight: 100,
        title: Text(
          "Meet Jeje Program",
          style: GoogleFonts.alice(
            fontSize: 45,

        ),
      )
        ,centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min, //as tall as the widgets
          children: [
            //username
            Text("Username:", style: GoogleFonts.alice(fontSize: 30),),
            //username text field
            SizedBox( //since underline of text field takes upp all of widget's width
              width: 300,
              child: TextField(
                onChanged: (value){ inputUsername = value;globalUsername = value;  }, //chose to use brackets and not arrow function
                  //onChanged = change means when insert a text, triggers a function which detects ur text and assigns it to a var
                  keyboardType: TextInputType.name,
                  cursorWidth: 3,
                  textAlign: TextAlign.center,

                  maxLength: 20,
                  style: GoogleFonts.alice(fontSize: 18)

              ),
            ),

            SizedBox(height: 25),
            //password
             Text("Password:", style: GoogleFonts.alice(fontSize: 30)),
            SizedBox(
              width: 300,
              child: TextField(
                //password text field
                  onChanged: (value){ inputPassword = value;  },
                  keyboardType: TextInputType.name,
                  cursorWidth: 3,
                  textAlign: TextAlign.center,
                  maxLength: 20,
                  obscuringCharacter: '•',
                  obscureText: true,
                  style: GoogleFonts.alice(fontSize: 18)

              ),
            ),

            SizedBox(height: 20,),
            //Confirm button
              ElevatedButton(onPressed: checkCredentials,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical:5),
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 22
                    ),
                  ),
                ),
              ),
          ],
        )
      ),
    );
  }
}

class _StateJejePage extends State<JejePage>
{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Column(children:[
        Text("Hey $globalUsername",
            style: GoogleFonts.afacad(fontSize: 45)),
        Image.asset('assets/images/jejeje.jpg'),
        Text("Grazie per i tuoi dati <3",
            style: GoogleFonts.afacad(fontSize: 35)),
      ]),
    );
  }
}