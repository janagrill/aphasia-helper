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

  _regenerateDate() {
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
        Text(
          dateFormat.format(selectedDate),
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
              onPressed: () => _regenerateDate(),
            ),
            SizedBox(width: 50),
            RoundButton(
              text: 'Select',
              icon: Icons.date_range,
              onPressed: () => _selectDate(context),
            ),
          ],
        ),
        SizedBox(height: 100),
        RoundButton(
          text: 'Play',
          icon: Icons.play_arrow,
          onPressed: () => _speak(selectedDate),
        ),
      ],
    );
  }
}
