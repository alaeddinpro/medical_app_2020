import 'package:flutter/material.dart';

import 'package:medical/modules/meddi.dart';

import '../database.dart';

class NoteDetail extends StatefulWidget {
  final Note note;

  NoteDetail(this. note);

  @override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.note);
  }
}

class NoteDetailState extends State<NoteDetail> {

  // static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();


  Note note;

  TextEditingController titleController = TextEditingController();

  TextEditingController mincont = TextEditingController();

  TextEditingController maxcont = TextEditingController();

  TextEditingController dosagecont = TextEditingController();

  TextEditingController mincont1 = TextEditingController();

  TextEditingController maxcont1 = TextEditingController();

  TextEditingController dosagecont1 = TextEditingController();

  TextEditingController mincont2 = TextEditingController();

  TextEditingController maxcont2 = TextEditingController();

  TextEditingController dosagecont2 = TextEditingController();
  var nameTECs = <TextEditingController>[];
  var ageTECs = <TextEditingController>[];
  var jobTECs = <TextEditingController>[];
  var cards = <Card>[];

  NoteDetailState(this.note);



  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    titleController.text = note.title;
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
            backgroundColor: Color(0xff2198F3),
            leading: IconButton(icon: Icon(
                Icons.arrow_back),
                onPressed: () {
                  // Write some code to control things, when user press back button in AppBar
                  moveToLastScreen();
                }
            ),
          ),

          body:  Padding(

              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: ListView(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: TextField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('Something changed in Title Text Field');
                        updateTitle();
                      },
                      decoration: InputDecoration(
                          labelText: 'Name Medical',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Center(child: Text("Renal clearance",style: TextStyle(fontSize: 20),)),
                  SizedBox(
                    height: 20,
                  ),
                Row(
                  children:[
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(child:TextField(

                      controller: mincont,
                    // style: textStyle,
                    onChanged: (value) {
                      // debugPrint('Something changed in Title Text Field');
                      updateMin();
                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        labelText: "Min",
                      ),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(child: TextField(
                      controller: maxcont,
                      // style: textStyle,
                      onChanged: (value) {
                        // debugPrint('Something changed in Title Text Field');
                        updateMax();
                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        labelText: "Max",
                      ),
                      keyboardType: TextInputType.number,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(child: TextField(
                      controller: dosagecont,
                      // style: textStyle,
                      onChanged: (value) {
                        // debugPrint('Something changed in Title Text Field');
                        updateDosage();

                      },
                      decoration:InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        labelText: "Dosage",
                      ),
                      keyboardType: TextInputType.number,
                    )),


                    SizedBox(
                      width: 20,
                    ),
                    ]),

                  Column(
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Color(0xff2198F3),
                        textColor: Colors.white,
                        child: Text(
                          'Add',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Add button clicked");
                            cards.add(createCard());
                          });
                        },
                        splashColor: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Text("bilirubin",style: TextStyle(fontSize: 20),)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      children:[
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(child:TextField(
                          controller: mincont1,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateMin1();
                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Min",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(child: TextField(
                          controller: maxcont1,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateMax1();
                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Max",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(child: TextField(
                          controller: dosagecont1,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateDosage1();

                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Dosage",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                      ]),
                  Column(
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Color(0xff2198F3),
                        textColor: Colors.white,
                        child: Text(
                          'Add',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Add button clicked");
                            cards.add(createCard());
                          });
                        },
                        splashColor: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: Text("tgo/tgp",style: TextStyle(fontSize: 20),)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      children:[
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(child:TextField(
                          controller: mincont2,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateMin2();
                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Min",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(child: TextField(
                          controller: maxcont2,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateMax2();
                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Max",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(child: TextField(
                          controller: dosagecont2,
                          // style: textStyle,
                          onChanged: (value) {
                            // debugPrint('Something changed in Title Text Field');
                            updateDosage2();

                          },
                          decoration:InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            labelText: "Dosage",
                          ),
                          keyboardType: TextInputType.number,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                      ]),
                  Column(
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Color(0xff2198F3),
                        textColor: Colors.white,
                        child: Text(
                          'Add',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint("Add button clicked");

                          });
                        },
                        splashColor: Colors.blueAccent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Fourth Element
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            color: Color(0xff2198F3),
                            textColor: Colors.white,
                            child: Text(
                              'Save',
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                debugPrint("Save button clicked");

                                _save();
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

  Card createCard() {
    var nameController = TextEditingController();
    // var ageController = TextEditingController();
    // var jobController = TextEditingController();
    nameTECs.add(nameController);
    // ageTECs.add(ageController);
    // jobTECs.add(jobController);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Person ${cards.length + 1}'),
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Full Name')),
              // TextField(
              //     controller: ageController,
              //     decoration: InputDecoration(labelText: 'Age')),
              // TextField(
              //     controller: jobController,
              //     decoration: InputDecoration(labelText: 'Study/ job')),
            ],
          ),
        );
  }

  // Update the title of Note object
  void updateTitle(){
    note.title = titleController.text;

  }

  // Update the min of Note object
  void updateMin() {
    note.min = int.parse(mincont.text);
  }
  void updateMin1() {
    note.min1 = int.parse(mincont1.text);
  }
  void updateMax() {
    note.max = int.parse(maxcont.text);
  }
  void updateMax1() {
    note.max1 = int.parse(maxcont1.text);
  }
  void updateDosage() {
    note.dosage = int.parse(dosagecont.text);
  }
  void updateDosage1() {
    note.dosage1 = int.parse(dosagecont1.text);
  }
  void updateMin2() {
    note.min2 = int.parse(mincont2.text);
  }
  void updateMax2() {
    note.max2 = int.parse(maxcont2.text);
  }
  void updateDosage2() {
    note.dosage2 = int.parse(dosagecont2.text);
  }
  // Update the description of Note object
  // void updateDescription() {
  //   note.description = descriptionController.text;
  // }

  // Save data to database
  void _save() async {

    moveToLastScreen();

    // note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null) {  // Case 1: Update operation
      result = await helper.updateNote(Note.fromMapObject({
        'id': note.id,
        'title': note.title,
        'min': note.min,
        'max': note.max,
        'dosage': note.dosage,
        'min1': note.min1,
        'max1': note.max1,
        'dosage1': note.dosage1,
        'min2': note.min2,
        'max2': note.max2,
        'dosage2': note.dosage2,
      }));
    } else { // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
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




