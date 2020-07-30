import 'package:flutter/material.dart';
import 'dart:math';
import 'package:my_flutter_app/Trig_N_Log_Logic.dart';

/*Develop an app that will demonstrate the use of log function and trignometric function.
Separate the logical layer from the implementation layer*/


class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  TextEditingController numberInputController = new TextEditingController();
  double total = 0.0;
  String output = "Answer";
  String operation = "";

  void calculate(){
    setState(() {
      double radians = double.parse(numberInputController.text)*pi/180;

      switch(operation){
        case "Sine":{
          total = Logic().Sin(radians);

        }
        break;
        case "Cosine":{
          total = Logic().Cos(radians);
        }
        break;
        case "Tan":{
          total = Logic().Tan(radians);
        }
        break;
        default:{
          //log is default here
          total = Logic().Log(double.parse(numberInputController.text));
        }
        break;
      }

      output = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[TextField(
                controller: numberInputController,
                decoration: InputDecoration(hintText: 'Enter input below'),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,

              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    operation = "Sine";
                    calculate();
                    print(output);
                  },
                  child: Text('Sine',),
                  color: Colors.teal,
                ),
                RaisedButton(
                  onPressed: () {
                    operation = "Cosine";
                    calculate();
                  },
                  child:  Text('Cosine'),
                  color: Colors.greenAccent,
                ),
                RaisedButton(
                  onPressed: () {
                    operation = "Tan";
                    calculate();
                  },
                  child:  Text('Tan'),
                  color: Colors.teal,
                ),
                RaisedButton(
                  onPressed: () {
                    //giving default operation for log
                    operation = "Log";
                    calculate();
                  },
                  child:  Text('Log'),
                  color: Colors.greenAccent,
                )
              ],
            ),
            Text('$output', style: TextStyle(
                fontSize: 20
            ),)
          ],
        ),
      ),
      backgroundColor: Colors.tealAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            output = 'Answer';
          });
        },
        child: Icon(
          Icons.refresh,
          color: Colors.teal,
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}

