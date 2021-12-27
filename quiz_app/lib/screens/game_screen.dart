import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/constants.dart';

import 'package:gradient_widgets/gradient_widgets.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          Container(
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TopBar(),
                const SizedBox(height: 20),
                ProgressBar(),
                const SizedBox(height: 30),
                CuestionCounter(),
                const SizedBox(height: 5),
                Divider(
                  thickness: 0.2,
                  color: kGrayColor,
                ),
                const SizedBox(height: 15),
                GameCard()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const List<Map> questionList = [
  {
    "question": "Quién pintó las meninas?",
    "options": [
      "Francisco de goya",
      "Diego velázquez",
      "Salvador dalí",
      "Monet"
    ],
    "answer": "Diego velázquez"
  },
  {
    "question": "Cuál es la capital de Hungría?",
    "options": ["Viena", "Praga", "Budapest", "Estambul"],
    "answer": "Budapest"
  },
  {
    "question": "Aproximadamente, ¿cuántos huesos tiene el cuerpo humano? ",
    "options": ["40", "390", "206", "110"],
    "answer": "206"
  },
  {
    "question": "Si P = M+N, ¿cuál de las siguientes fórmulas es correcta?",
    "options": ["M = P-N", "N = M+P", "N = M-P", "M = P/N"],
    "answer": "M = P-N"
  }
];

class GameCard extends StatefulWidget {
  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        children: [
          for (Map question in questionList) QuestionCard(question: question),
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final question;

  QuestionCard({this.question});

  @override
  _QuestionCardState createState() => _QuestionCardState(question: question);
}

class _QuestionCardState extends State<QuestionCard> {
  final question;

  _QuestionCardState({this.question});

  @override
  Widget build(BuildContext context) {
    final List option = question["options"];

    return Card(
      elevation: 5,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${question["question"]}",
            style: TextStyle(fontSize: 25, color: kBlackColor),
          ),
          const SizedBox(height: 20),
          for (String option in option)
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5, bottom: 5),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${option}",
                          style: TextStyle(
                            color: kGrayColor,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: kGrayColor)),
                        )
                        //Icon(Icons.check_circle_outline)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: kGrayColor, width: 1)),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class CuestionCounter extends StatefulWidget {
  @override
  _CuestionCounterState createState() => _CuestionCounterState();
}

class _CuestionCounterState extends State<CuestionCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Question 1",
          style: TextStyle(color: kGrayColor, fontSize: 35),
        ),
        Text(
          "/4",
          style: TextStyle(color: kGrayColor, fontSize: 28),
        ),
      ],
    );
  }
}

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: GradientProgressIndicator(
                value: 0.4,
                gradient: kPrimaryGradient,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "23 Sec",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.timer_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
