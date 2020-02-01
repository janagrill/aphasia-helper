import 'package:flutter/material.dart';

import 'date_trainer.dart';
import 'number_trainer.dart';

var tabs = [
  NumberTrainer(),
  DateTrainer(),
  Text('Words'),
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int tabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aphasia'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: (int index) => setState(() {
          tabIndex = index;
        }),
        items: [
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
          )
        ],
      ),
      body: Center(child: tabs[tabIndex]),
    );
  }
}
