import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'main.dart';
import 'ReuesableCard.dart';
import 'Const.dart';
import 'pageResult.dart';
import 'BMI_FUNCTION.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { Male, Female }

class _InputPageState extends State<InputPage> {
  var _Gender;
  double _Height = 180;
  double _Weight = 70;
  double _Age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _Gender = Gender.Male;
                      });
                    },
                    child: containerCard(
                      colour:
                          _Gender == Gender.Male ? colorActive : colorUnActive,
                      childCard: columnWidget(
                        text: "Male",
                        icoun: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _Gender = Gender.Female;
                      });
                    },
                    child: containerCard(
                      colour: _Gender == Gender.Female
                          ? colorActive
                          : colorUnActive,
                      childCard: columnWidget(
                        text: "Female",
                        icoun: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: containerCard(
              colour: colorActive,
              childCard: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        fontSize: 30,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _Height.round().toString(),
                          style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " cm",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _Height,
                      min: 80,
                      max: 220,
                      onChanged: (double value) =>
                          setState(() => _Height = value),
                      label: "",
                      activeColor: Colors.deepPurple[600],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: containerCard(
                    colour: colorActive,
                    childCard: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "WEIGHT",
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _Weight.round().toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " kg",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionFunction(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () => setState(() => --_Weight),
                                tag: "h1",
                              ),
                              FloatingActionFunction(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () => setState(() => ++_Weight),
                                tag: "h2",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: containerCard(
                    colour: colorActive,
                    childCard: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 20,
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _Age.round().toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FloatingActionFunction(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () => setState(() => --_Age),
                                  tag: "h3"),
                              FloatingActionFunction(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () => setState(() => ++_Age),
                                tag: "h4",
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              var calcu = CalculatorBrain(
                  height: _Height.toInt(), weight: _Weight.toInt());

              return PageResult(
                  bmiResult: calcu.calculateBMI(),
                  resultText: calcu.getResult(),
                  interpretation: calcu.getInterpretation());
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[900],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              padding: EdgeInsets.only(bottom: 8),
              width: double.infinity,
              height: 80,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingActionFunction extends StatelessWidget {
  final icon;
  final onpressed;
  final tag;

  const FloatingActionFunction(
      {@required this.icon, @required this.onpressed, @required this.tag});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: tag,
      backgroundColor: Colors.deepPurple[600],
      onPressed: onpressed,
      child: Icon(
        icon,
        size: 40,
        color: Colors.white,
      ),
    );
  }
}
