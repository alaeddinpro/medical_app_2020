
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Moreinfo extends StatelessWidget{
  var randomtext="There are conditions for using the application. The application is used by doctors only. There are 4 buttons on the home page, the first button is to add the drug, the second button is to put the results of the analysis and choose the drug with giving the injection for the appropriate dose to the patient, the third button is a list of patients who have been examined by you with the name registration surname, age, weight, height and gender, all this information you find is reserved for you. It was developed by AA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More Info"),
      ),
      body:new SingleChildScrollView(child:
          new Text(randomtext,style: new TextStyle(fontSize: 30.0,fontFamily:'Revolvingdor')),),
    );

  }
}
