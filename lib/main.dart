import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReuesableCard.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0C1134),
        primaryColor: Color(0xFF111539),
      ),
    );
  }
}
