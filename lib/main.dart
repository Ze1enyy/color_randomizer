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

class _ColorRandomState extends State<ColorRandom> {
  Color backgroundColor = Colors.white;
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
        decoration: BoxDecoration(color: backgroundColor),
        curve: Curves.linearToEaseOut,
        child: InkWell(
          onTap: () {
            setState(() {
              Random random = Random();
              backgroundColor = Color.fromRGBO(
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextInt(255),
                  random.nextDouble());
            });
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
