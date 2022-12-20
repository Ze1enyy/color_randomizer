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

  AnimatedPositioned circleRandom() {
    double circHeight = 200;
    double circWidth = 200;
    double randomX =
        Random().nextDouble() * MediaQuery.of(context).size.width * 0.75;
    double randomY =
        Random().nextDouble() * MediaQuery.of(context).size.height * 0.75;
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        left: randomX,
        bottom: randomY,
        child: GestureDetector(
          onTap: () {
            setState(() {
              score += 100;
              circleColor = Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextDouble());
              backgroundColor = Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextDouble());

              randomX = Random().nextDouble() *
                  MediaQuery.of(context).size.width *
                  0.75;
              randomY = Random().nextDouble() *
                  MediaQuery.of(context).size.height *
                  0.75;
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
        child: Stack(
          children: [
            circleRandom(),
            circleRandom(),
            circleRandom(),
            circleRandom(),
            circleRandom(),
            circleRandom(),
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
                                double randomX = Random().nextDouble() *
                                    MediaQuery.of(context).size.width *
                                    0.75;
                                double randomY = Random().nextDouble() *
                                    MediaQuery.of(context).size.height *
                                    0.75;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Text("Your score is: $score"),
                                margin: EdgeInsets.only(top: 10),
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
}
