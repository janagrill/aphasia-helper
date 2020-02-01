import 'package:flutter/material.dart';

class EmergencyItem extends StatelessWidget {
  final String text;
  final String imageLink;
  final VoidCallback onPressed;

  EmergencyItem({
    @required this.text,
    @required this.imageLink,
    @required this.onPressed,
  });

  Widget build(context) {
    return Column(
      children: <Widget>[
        SizedBox.fromSize(
          size: Size(100, 100),
          child: InkWell(child:Image.asset("images/" + imageLink), onTap: onPressed),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
