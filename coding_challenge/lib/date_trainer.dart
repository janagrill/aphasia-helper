import 'package:flutter/material.dart';

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
        Text("${selectedDate.toLocal()}".split(' ')[0], style: TextStyle(fontSize: 30)),
        RaisedButton(onPressed: () => _selectDate(context), child: Text('Select date')),
        IconButton(
          iconSize: 80,
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            print('play button pressed');
          },
        ),
        Text(
          'Play word',
          style: TextStyle(fontSize: 30),
        ),
        IconButton(
          iconSize: 80,
          icon: Icon(Icons.navigate_next),
          onPressed: () {
            print('next button pressed');
          },
        ),
        Text(
          'Next word',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}