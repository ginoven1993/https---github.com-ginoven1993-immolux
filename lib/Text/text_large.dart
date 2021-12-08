import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextLarge extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  TextLarge({Key key, this.size = 30, this.text, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
