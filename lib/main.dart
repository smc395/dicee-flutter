import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text('Dicee'),
            backgroundColor: Colors.red,
          ),
          body: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  int total = 2;

  void getDice() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
      total = leftDiceNum + rightDiceNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          '$total',
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: () {
                  getDice();
                },
                child: Image.asset('images/dice$leftDiceNum.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  getDice();
                },
                child: Image.asset('images/dice$rightDiceNum.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
