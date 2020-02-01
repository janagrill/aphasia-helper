import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'round_button.dart';

FlutterTts flutterTts = FlutterTts();

class DateTrainer extends StatefulWidget {
  @override
  _DateTrainerState createState() => _DateTrainerState();
}

class _DateTrainerState extends State<DateTrainer> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("${selectedDate.toLocal()}".split(' ')[0],
            style: TextStyle(fontSize: 30)),
        RoundButton(
          text: 'Select date',
          icon: Icons.date_range,
          onPressed: () => _selectDate(context),
        ),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          onPressed: () {
            flutterTts.speak("Hello World");
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
