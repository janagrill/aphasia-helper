import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'round_button.dart';

FlutterTts flutterTts = FlutterTts();

class WordTrainer extends StatefulWidget {
  @override
  _WordTrainerState createState() => _WordTrainerState();
}

class _WordTrainerState extends State<WordTrainer> {
  String currentWord;

  _WordTrainerState() {
    _fetchWord();
  }

  Future<Null> _refetchWord(BuildContext context) {
    setState(() {
      _fetchWord();
    });
  }

  void _fetchWord() {
    currentWord = 'Random';
  }

  TextEditingController _controller = TextEditingController();

  Future<String> _createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Input word'),
          content: TextField(
            controller: _controller,
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
          currentWord,
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
              backgroundColor: Colors.green,
              onPressed: () => _refetchWord(context),
            ),
            SizedBox(width: 50),
            RoundButton(
              text: 'Input',
              icon: Icons.keyboard,
              backgroundColor: Colors.green,
              onPressed: () => _createAlertDialog(context).then((onValue) {
                setState(() {
                  currentWord = onValue;
                });
              }),
            ),
          ],
        ),
        SizedBox(height: 100),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          backgroundColor: Colors.green,
          onPressed: () {
            flutterTts.speak(currentWord);
          },
        ),
      ],
    );
  }
}
