import 'package:flutter/material.dart';
import 'package:medical/modules/PatMap.dart';
import '../databasepat.dart';

class Addpas extends StatefulWidget {


  final PatMap past;

  Addpas(this. past);

  @override
  State<StatefulWidget> createState() {

    return Add(this.past);
  }
}

class Add extends State<Addpas> {

  // static var _priorities = ['High', 'Low'];

  Patientdb helper = Patientdb();
  List<PatMap> PastList;
  int count = 0;
  PatMap past;

  TextEditingController nomController = TextEditingController();

  TextEditingController precont = TextEditingController();

  TextEditingController agecont = TextEditingController();

  TextEditingController taillcont = TextEditingController();

  TextEditingController poidscont = TextEditingController();

  static var _priorities = ['Man', 'Woman'];

  Add(this.past);



  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    nomController.text = past.nom;
    // mincont.text = note.min;

    // descriptionController.text = note.description;

    return WillPopScope(

      // ignore: missing_return
      onWillPop: () {
        // Write some code to control things, when user press Back navigation button in device navigationBar
        moveToLastScreen();
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Medical"),
          backgroundColor: Color(0xff353b48),
          leading: IconButton(icon: Icon(
              Icons.arrow_back),
              onPressed: () {
                // Write some code to control things, when user press back button in AppBar
                moveToLastScreen();
              }
          ),
        ),

        body:



        Padding(
          padding: EdgeInsets.only(top: 150.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[

              Row(
                children: [
                  Flexible(child:TextField(

                    controller: nomController,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updateNom();
                    },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      labelText: "FirstName",
                    ),
                  )),
                  SizedBox(width: 30,),
                  Flexible(child:TextField(

                    controller: precont,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updatePrenom();
                    },
                    decoration:InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      labelText: "LastName",
                    ),
                  )),
                ],
              ),
                    SizedBox(
                      height: 30,
                    ),
              Row(
                children: [
                  Flexible(child:TextField(
                    maxLength: 3,
                    controller: agecont,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updateAge();
                    },
                    decoration:InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      labelText: "Age",
                    ),
                    keyboardType: TextInputType.number,
                  )),
                  SizedBox(width: 30,),
                  Flexible(child:TextField(
                    maxLength: 3,
                    controller: taillcont,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updatetaill();
                    },
                    decoration:InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      labelText: "Taille",
                      suffix: Text("cm"),
                    ),
                    keyboardType: TextInputType.number,
                  )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Flexible(child:TextField(
                    maxLength: 3,
                    controller: poidscont,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updatePoids();
                    },
                    decoration:InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      labelText: "Poids",
                      suffix: Text("kg"),
                    ),
                    keyboardType: TextInputType.number,
                  )),
                  SizedBox(width: 30,),
                  DropdownButton(
                      items: _priorities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String> (
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),

                      style: textStyle,

                      value: getPriorityAsString(past.priority),

                      onChanged: (valueSelectedByUser) {
                        setState(() {
                          debugPrint('User selected $valueSelectedByUser');
                          updatePriorityAsInt(valueSelectedByUser);
                        });
                      }
                  ),
                ],
              ),

              // Fourth Element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        color: Color(0xff353b48),
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Save button clicked");

                            _save();
                            print("hhhhhhh");
                          });
                        },
                        splashColor: Colors.blueAccent,
                      ),
                    ),

                    Container(width: 5.0,),



                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'Man':
        past.priority = 1;
        break;
      case 'Woman':
        past.priority = 2;
        break;
    }
  }
  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];  // 'High'
        break;
      case 2:
        priority = _priorities[1];  // 'Low'
        break;
    }
    return priority;
  }

  // Update the title of Note object
  void updateNom(){
    past.nom = nomController.text;

  }
  //
  // // Update the min of Note object
  void updatePrenom() {
    past.prenom = precont.text;
  }
  void updateAge() {
    past.age = int.parse(agecont.text);
  }
  void updatetaill() {
    past.taill = double.parse(taillcont.text);
  }
  void updatePoids() {
    past.poids = double.parse(poidscont.text);
  }


  // Save data to database
  void _save() async {

    moveToLastScreen();

    // note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (past.id != null) {  // Case 1: Update operation
      result = await helper.updateNote(PatMap.fromMapObject({
        'id': past.id,
        'nom': past.nom,
        'prenom': past.prenom,
        'age': past.age,
        'taill': past.taill,
        'poids': past.poids,
        'sexe': past.priority,

      }));
    } else { // Case 2: Insert Operation
      result = await helper.insertNote(past);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

  }


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}




