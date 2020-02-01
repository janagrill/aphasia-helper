import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'emergency_item.dart';

FlutterTts flutterTts = FlutterTts();

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {

  List<EmergencyItem> emergencyList = <EmergencyItem>[
    EmergencyItem(
          imageLink: "image1.png",
          text: 'a cold',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a cold");
          },
    ),
    EmergencyItem(
          imageLink: "image2.png",
          text: 'a cough',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a cough");
          },
    ),
    EmergencyItem(
          imageLink: "image3.png",
          text: 'a fever',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a fever");
          },
    ),
    EmergencyItem(
          imageLink: "image4.png",
          text: 'a sore throat',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a sore throat");
          },
    ),
    EmergencyItem(
          imageLink: "image5.png",
          text: 'a headache',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a headache");
          },
    ),
    EmergencyItem(
          imageLink: "image6.png",
          text: 'a stomach ache',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a stoamch ache");
          },
    ),
    EmergencyItem(
          imageLink: "image7.png",
          text: 'a toothache',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a toothache");
          },
    ),
    EmergencyItem(
          imageLink: "image8.png",
          text: 'an earache',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a earache");
          },
    ),
    EmergencyItem(
          imageLink: "image9.png",
          text: 'a cramp',
          onPressed: () {
            flutterTts.speak("I don't feel good. I have a cramp");
          },
    )];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: emergencyList,
          
        );
  }
}
