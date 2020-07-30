import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/Trig_N_Log_Screen.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to flutter'),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello Everyone'),
            RaisedButton(
              color: Colors.black,
              textColor: Colors.tealAccent,
              child: Text('Click to See Calculator Screen'),
              onPressed:(){
                navigateToCalculatorScreen(context);
              },
            ),


          ],
        ),
      ),
      backgroundColor: Colors.tealAccent,
    );

  }


  void navigateToCalculatorScreen(context) async{
    Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorApp() ,));
  }


}

