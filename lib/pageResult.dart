import 'package:bmi_calculator/Const.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class PageResult extends StatelessWidget {
  PageResult({
    @required this.interpretation,
    @required this.bmiResult,
    @required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  resultTextDef() {
    if (resultText == "Normal") {
      return Colors.green;
    } else if (resultText == "Overweight") {
      return Colors.red[900];
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "RESULT",
        // style: TextStyle(fontSize: 20),
      )),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF111328),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 19,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Your Result",
                  style: TextStyle(fontSize: 40, color: textColor),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  resultText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: resultTextDef()),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  bmiResult,
                  style: TextStyle(fontSize: 50, color: textColor),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                child: Text(
                  interpretation,
                  style: TextStyle(fontSize: 26, color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
