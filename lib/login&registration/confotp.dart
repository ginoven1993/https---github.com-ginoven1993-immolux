import 'package:flutter/material.dart';

class ConfOTP extends StatefulWidget {
  @override
  _ConfOTPState createState() => _ConfOTPState();
}

class _ConfOTPState extends State<ConfOTP> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 70,
            bottom: 70,
            left: 50,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verification OTP",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 31,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Votre code sera envoyé sur votre numéro xxx-xxx-xxx-57",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 42,
                    child: TextFormField(
                      autofocus: true,
                      obscureText: true,
                      style: TextStyle(fontSize: 47),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(),
                      onChanged: (value) {
                        nextField(value, pin2FocusNode);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      obscureText: true,
                      style: TextStyle(fontSize: 47),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(),
                      onChanged: (value) => nextField(value, pin3FocusNode),
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    child: TextFormField(
                      focusNode: pin3FocusNode,
                      obscureText: true,
                      style: TextStyle(fontSize: 47),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(),
                      onChanged: (value) => nextField(value, pin4FocusNode),
                    ),
                  ),
                  SizedBox(
                    width: 42,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      obscureText: true,
                      style: TextStyle(fontSize: 47),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(),
                      onChanged: (value) {
                        if (value.length == 1) {
                          pin4FocusNode.unfocus();
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 85),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0070ec),
                  padding: EdgeInsets.symmetric(
                    horizontal: 106,
                    vertical: 18,
                  ),
                ),
                child: Text(
                  "Continuer",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
