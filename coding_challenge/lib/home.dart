import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aphasia'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
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
      body: PlayWordPage(),
    );
  }
}

class PlayWordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Date',
          ),
          IconButton(
            iconSize: 80,
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              print('play button pressed');
            },
          ),
          IconButton(
            iconSize: 80,
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              print('next button pressed');
            },
          ),
        ],
      ),
    );
  }
}
