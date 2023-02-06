import 'package:flutter/material.dart';
import 'dart:math';

import '../main.dart';

class ColorShooter extends StatefulWidget {
  @override
  _ColorShooterState createState() => _ColorShooterState();
}

class _ColorShooterState extends State<ColorShooter> with RandomColor {
  Color circleColor = Colors.red;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: AnimatedContainer(
        color: changeBgColor(),
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: List.generate(
                  5,
                  (index) {
                    return randomCircle();
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 35),
                      child: Column(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.refresh,
                            ),
                            onPressed: () {
                              setState(() {
                                score = 0;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text("Your score is: $score"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color changeCircColor() {
    circleColor = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextDouble());
    return circleColor;
  }

  Offset randomCirclePos() {
    double randomX =
        Random().nextDouble() * (MediaQuery.of(context).size.width - 200);
    double randomY =
        Random().nextDouble() * (MediaQuery.of(context).size.height - 200);
    return Offset(randomX, randomY);
  }

  void increment() {
    score += 100;
  }

  AnimatedPositioned randomCircle() {
    double circHeight = 200;
    double circWidth = 200;

    double randomX = Random().nextDouble() *
        (MediaQuery.of(context).size.width - 2 * circWidth);
    double randomY = Random().nextDouble() *
        (MediaQuery.of(context).size.height - 2 * circHeight);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      left: randomX,
      bottom: randomY,
      child: GestureDetector(
        onTap: () {
          setState(() {
            score += 100;
            changeCircColor();
            changeBgColor();
          });
        },
        child: Container(
          height: circHeight,
          width: circWidth,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: circleColor, border: Border.all()),
        ),
      ),
    );
  }
}
