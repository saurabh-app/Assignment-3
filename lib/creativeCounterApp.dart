import 'dart:math';

import 'package:flutter/material.dart';

class CreativeCounterApp extends StatefulWidget {
  const CreativeCounterApp({Key? key}) : super(key: key);

  @override
  State<CreativeCounterApp> createState() => _CreativeCounterAppState();
}

class _CreativeCounterAppState extends State<CreativeCounterApp> {
  int counter = 0;
  double fontSize = 24;
  Color backgroundColor = Colors.white;

  final List<String> emojis = ['😐', '🙂', '😄', '🤩', '🚀'];

  // Generates a random color
  Color getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  // Returns emoji based on counter value
  String getEmoji(int count) {
    if (count < 3) return emojis[0];
    if (count < 6) return emojis[1];
    if (count < 9) return emojis[2];
    if (count < 12) return emojis[3];
    return emojis[4];
  }

  void incrementCounter() {
    setState(() {
      counter++;
      fontSize += 2;
      backgroundColor = getRandomColor();
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
      fontSize = 24;
      backgroundColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Creative Counter 🤹‍♂️'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getEmoji(counter),
              style: const TextStyle(fontSize: 80),
            ),
            const SizedBox(height: 20),
            Text(
              'Counter: $counter',
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: incrementCounter,
              child: const Text('Increment'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: resetCounter,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
