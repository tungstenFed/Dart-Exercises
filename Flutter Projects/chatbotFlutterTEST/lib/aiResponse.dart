import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:io';

//returns a future string because we have to promise dart that its GOING TO BE  a string
Future<String> askAndGetResponse(String input) async //async since its not going to be instant and we don't want it to block our whole program
{
  if (input == "Q" || input == "q") {
  exit(0);
}
  print("(Q - to quit)");


  String apiKey = "MYAPIKEY";
  GenerativeModel aiModel = GenerativeModel(
    model: 'gemini-2.5-flash',
    apiKey: apiKey,
  );

  List<Content> prompt = [
    Content.text(input),
  ]; //create list of 1 Content.text, so we create a content object and give
  //it a string inserted by the user

  GenerateContentResponse response = await aiModel.generateContent(
    prompt,
  ); //only accepts List of Content object
  String? resp = response.text;

  if (resp == null) {
    return "Sorry, I didn't quite catch that.";
  }

  return resp;
}
