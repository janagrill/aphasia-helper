import 'dart:math';

import 'package:flutter/material.dart';

import 'round_button.dart';

class NumberTrainer extends StatefulWidget {
  @override
  _NumberTrainerState createState() => _NumberTrainerState();
}

class _NumberTrainerState extends State<NumberTrainer> {
  final maxNumber = 100;
  final randomizer = new Random();
  int randomNumber;

  _NumberTrainerState() {
    _generateNumber(context);
  }

  Future<Null> _generateNumber(BuildContext context) {
    setState(() {
      randomNumber = randomizer.nextInt(100);
    });
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
        RoundButton(
          text: 'New number',
          icon: Icons.autorenew,
          onPressed: () => _generateNumber(context),
        ),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          onPressed: () {
            print('play button pressed');
          },
        ),
        RoundButton(
          text: 'Next',
          icon: Icons.navigate_next,
          onPressed: () {
            print('next button pressed');
          },
        ),
      ],
    );
  }
}
