// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

class ColorShooter extends StatefulWidget {
  const ColorShooter({super.key});

  @override
  State<ColorShooter> createState() => _ColorShooterState();
}

class _ColorShooterState extends State<ColorShooter> {
  Color backgroundColor = Colors.white;
  Color circleColor = Colors.red;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: (() {
          Navigator.of(context).pop();
        }),
      ),
      body: AnimatedContainer(
        color: backgroundColor,
        duration: Duration(milliseconds: 500),
        child: Column(
          children: [
            Flexible(
              child: Stack(
                children: List<Widget>.generate(
                  5,
                  (index) {
                    return circleRandom();
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
                                backgroundColor = Colors.white;
                                posX();
                                posY();
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
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color createCircColor() {
    circleColor = Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255), Random().nextDouble());
    return circleColor;
  }

  Color createBgColor() {
    backgroundColor = Color.fromRGBO(Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255), Random().nextDouble());
    return backgroundColor;
  }

  double posX() {
    double randomX =
        Random().nextDouble() * MediaQuery.of(context).size.width * 0.75;
    return randomX;
  }

  double posY() {
    double randomY =
        Random().nextDouble() * MediaQuery.of(context).size.height * 0.75;
    return randomY;
  }

  void increment() {
    score += 100;
  }

  AnimatedPositioned circleRandom() {
    double circHeight = 200;
    double circWidth = 200;
    posX();
    posY();
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        left: posX(),
        bottom: posY(),
        child: GestureDetector(
          onTap: () {
            setState(() {
              increment();
              createCircColor();
              createBgColor();
              posX();
              posX();
            });
          },
          child: Container(
            height: circHeight,
            width: circWidth,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor,
                border: Border.all()),
          ),
        ));
  }
}
