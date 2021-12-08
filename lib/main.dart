import 'dart:html';

import 'package:flutter/material.dart';
import 'package:immolux/welcome/delayanimation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMMOLUX ',
      debugShowCheckedModeBanner: false,
      home: DelayAnimation(),
    );
  }
}
