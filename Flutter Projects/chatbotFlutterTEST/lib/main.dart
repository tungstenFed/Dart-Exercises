import 'package:flutter/material.dart';
import 'package:chatbotfluttertest/aiResponse.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'ChatBot Implementation test'),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  var input = "";
  String response = "Waiting for Response";


  void aiResponse() async
  {
    setState(()
    {
      response = "I'm thinking...";
    });

    var responseNotImplemented = await askAndGetResponse(input); //await until string is completed

    setState(()
    {
      response = responseNotImplemented;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Chatbot Testing - Flutter',style: TextStyle(fontSize: 20),),
            Text(
              "Hello, User.",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox( //for width
              width: 250,
              child: TextField(
                minLines: 1,
                maxLines: 4,
                maxLength: 200,
                onChanged: (value){input = value;},
              ),
            ),
            ElevatedButton(
              onPressed: aiResponse,
              child: Text("Get Response"),

            ),
            SizedBox(height: 20),
            //response box
            Container(
              height: 300,
              width: 320,

              decoration: BoxDecoration(
                border: BoxBorder.all(width:2, color: Colors.black87),

                borderRadius: BorderRadius.circular(10),
              ),
              child: Scrollbar(child: SingleChildScrollView(
                child: Text(
                response, textAlign: TextAlign.center,
                style: TextStyle(shadows: [Shadow(color: Colors.grey, blurRadius: 5)]),
              ),
              ))
            )
          ],
        ),
      ),

    );
  }
}
