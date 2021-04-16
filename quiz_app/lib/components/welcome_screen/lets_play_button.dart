import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screens/game_screen.dart';

import '../../constants.dart';

class LetsPlayButton extends StatefulWidget {
  @override
  _LetsPlayButtonState createState() => _LetsPlayButtonState();
}

class _LetsPlayButtonState extends State<LetsPlayButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CupertinoPageRoute(builder: (context) => GameScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradient,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: 40.0), // min sizes for Material buttons
        child: Center(
          child: const Text(
            "LET'S START QUIZ",
            style: TextStyle(
              color: Colors.black45,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
