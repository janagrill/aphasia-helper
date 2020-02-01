import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/date_trainer.dart';

import 'date_trainer.dart';
import 'number_trainer.dart';
import 'word_trainer.dart';
import 'emergency.dart';

var tabs = [
  NumberTrainer(),
  DateTrainer(),
  WordTrainer(),
  Emergency(),
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aphasia'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabIndex,
        onTap: (int index) => setState(() {
          tabIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_alert),
            title: new Text('Emergency'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.format_list_numbered),
            title: new Text('Numbers'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.date_range),
            title: new Text('Dates'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Words'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_alert),
            title: new Text('Emergency'),
          )
        ],
      ),
      body: Center(child: tabs[tabIndex]),
    );
  }
}