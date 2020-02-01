import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      title: 'Aphasia',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aphasia'),
        ),
        body: PlayWordPage(),
      ),
    ),
  );
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
          FlatButton(
            onPressed: () {
              print('play button pressed');
            },
            child: Icon(Icons.play_arrow),
          ),
          FlatButton(
            onPressed: () {
              print('next button pressed');
            },
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
