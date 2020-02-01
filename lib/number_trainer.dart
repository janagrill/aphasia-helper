import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'round_button.dart';

FlutterTts flutterTts = FlutterTts();

class NumberTrainer extends StatefulWidget {
  @override
  _NumberTrainerState createState() => _NumberTrainerState();
}

class _NumberTrainerState extends State<NumberTrainer> {
  final maxNumber = 100;
  final randomizer = new Random();
  int randomNumber;

  _NumberTrainerState() {
    _generateNumber();
  }

  Future<Null> _regenerateNumber(BuildContext context) {
    setState(() {
      _generateNumber();
    });
  }

  void _generateNumber() {
    randomNumber = randomizer.nextInt(100);
  }

  TextEditingController _controller = TextEditingController();

  Future<String> _createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Input number'),
          content: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              onPressed: () {
                Navigator.of(context).pop(_controller.text.toString());
              },
              child: Text('Submit'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          '${randomNumber}',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundButton(
              text: 'Random',
              icon: Icons.autorenew,
              backgroundColor: Colors.blue,
              onPressed: () => _regenerateNumber(context),
            ),
            SizedBox(width: 50),
            RoundButton(
              text: 'Input',
              icon: Icons.keyboard,
              backgroundColor: Colors.blue,
              onPressed: () => _createAlertDialog(context).then((onValue) {
                setState(() {
                  randomNumber = int.parse(onValue);
                });
              }),
            ),
          ],
        ),
        SizedBox(height: 100),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          backgroundColor: Colors.blue,
          onPressed: () {
            flutterTts.speak('${randomNumber}');
          },
        ),
      ],
    );
  }
}
