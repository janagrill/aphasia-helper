import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';

import 'round_button.dart';

FlutterTts flutterTts = FlutterTts();
DateFormat dateFormat = DateFormat.yMMMd();

class DateTrainer extends StatefulWidget {
  @override
  _DateTrainerState createState() => _DateTrainerState();
}

class _DateTrainerState extends State<DateTrainer> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    _setSelectedDate(date);
  }

  _setSelectedDate(DateTime date) {
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  _speak(DateTime date) {
    flutterTts.speak(dateFormat.format(date));
  }

  _selectRandomDate() {
    var offset = Random().nextInt(355);
    var year = DateTime.now().year;
    var date = DateTime(year).add(Duration(days: offset));
    _setSelectedDate(date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(dateFormat.format(selectedDate),
            style: TextStyle(fontSize: 30)),
        SizedBox(height: 30),
        RoundButton(
          text: 'Select date',
          icon: Icons.date_range,
          onPressed: () => _selectDate(context),
        ),
        SizedBox(height: 30),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          onPressed: () => _speak(selectedDate),
        ),
        SizedBox(height: 30),
        RoundButton(
          text: 'Next',
          icon: Icons.navigate_next,
          onPressed: () => _selectRandomDate(),
        ),
      ],
    );
  }
}
