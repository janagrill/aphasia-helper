import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'data_manager.dart';
import 'round_button.dart';

FlutterTts flutterTts = FlutterTts();
DataManager dataManager = DataManager();

class WordTrainer extends StatefulWidget {
  @override
  _WordTrainerState createState() => _WordTrainerState();
}

class _WordTrainerState extends State<WordTrainer> {
  String currentWord = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchWord();
    });
  }

  void _fetchWord() async {
    var words = await dataManager.getWords();

    if (words.length == 0) {
      return;
    } else if (words.length == 1) {
      setState(() {
        currentWord = words[0];
      });
    } else {
      var word = currentWord;

      do {
        word = words[Random().nextInt(words.length)];
      } while (word == currentWord);

      setState(() {
        currentWord = word;
      });
    }
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
              onPressed: () => _fetchWord(),
            ),
            SizedBox(width: 50),
            RoundButton(
              text: 'Input',
              icon: Icons.keyboard,
              backgroundColor: Colors.green,
              onPressed: () => _createAlertDialog(context).then((onValue) {
                if (onValue != null) {
                  setState(() {
                    currentWord = onValue;
                    dataManager.addWord(currentWord);
                  });
                }
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
