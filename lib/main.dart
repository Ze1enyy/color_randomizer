import 'package:color_randomizer/widgets/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
// import 'package:flutter/analysis_options.yaml';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MaterialApp(
    home: ColorRandom(),
  ));
}

class ColorRandom extends StatefulWidget {
  const ColorRandom({super.key});

  @override
  State<ColorRandom> createState() => _ColorRandomState();
}

class _ColorRandomState extends State<ColorRandom> with RandomColor {
  String text = 'Hey there';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: const Icon(Icons.gamepad),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => ColorShooter()));
        },
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        decoration: BoxDecoration(color: bgColor),
        curve: Curves.linearToEaseOut,
        child: InkWell(
          onTap: () {
            changeBgColor();
          },
          child: Center(
            child: Stack(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    foreground: Paint()
                      ..strokeWidth = 2
                      ..color = Colors.black
                      ..style = PaintingStyle.stroke,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

mixin RandomColor<T extends StatefulWidget> on State<T> {
  Color bgColor = Colors.white;
  Color changeBgColor() {
    setState(() {
      var r = Random().nextInt(255);
      var g = Random().nextInt(255);
      var b = Random().nextInt(255);
      bgColor = Color.fromRGBO(r, g, b, Random().nextDouble());
    });
    return bgColor;
  }
}
