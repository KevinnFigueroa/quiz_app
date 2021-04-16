import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quiz_app/components/welcome_screen/lets_play_button.dart';
import 'package:quiz_app/components/welcome_screen/name_field.dart';
import 'package:quiz_app/components/welcome_screen/title.dart';

import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              height: MediaQuery.of(context).size.height / 1.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WelcomeTitle(),
                  NameField(),
                  LetsPlayButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
