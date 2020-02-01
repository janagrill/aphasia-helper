import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  RoundButton({
    @required this.text,
    @required this.icon,
    @required this.onPressed,
  });

  Widget build(context) {
    return SizedBox.fromSize(
      size: Size(100, 100),
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Material(
              color: Colors.blue,
              child: InkWell(
                splashColor: Colors.white,
                onTap: onPressed,
                child: Icon(
                  icon,
                  size: 60,
                ),
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
