import 'package:flutter/material.dart';
import 'package:immolux/welcome/welcomepage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DelayAnimation extends StatefulWidget {
  @override
  _DelayAnimationState createState() => _DelayAnimationState();
}

class _DelayAnimationState extends State<DelayAnimation> {
  void initState() {
    super.initState();
    _mockCheckForSession().then((status) {
      if (status) {
        _navigationWelcome();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 9000), () {});
    return true;
  }

  void _navigationWelcome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.lightBlue.shade700,
            alignment: Alignment.center,
            child: SizedBox(
              width: 300,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 45.0,
                  fontFamily: 'Canterbury',
                  color: Colors.white,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText(
                      'immolux',
                      textAlign: TextAlign.center,
                      duration: Duration(
                        milliseconds: 9000,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
