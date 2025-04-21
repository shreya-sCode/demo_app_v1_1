import 'package:flutter/material.dart';
import 'dart:math';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  const MyCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: SizedBox(
            width: double.infinity,
            child: Card(
              shadowColor: _getRandomColor(),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextButton(child: Text(title), onPressed: () {}),
                    Text(description),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Color _getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}
