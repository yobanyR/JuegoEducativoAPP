// widgets/word_display.dart
import 'package:flutter/material.dart';

class WordDisplay extends StatelessWidget {
  final String word;

  WordDisplay(this.word, {required double fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(word, style: TextStyle(fontSize: 24));
  }
}
