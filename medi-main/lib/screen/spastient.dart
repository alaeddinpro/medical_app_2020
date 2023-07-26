import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical/modules/PatMap.dart';

import 'package:medical/screen/addpat.dart';
import 'package:sqflite/sqflite.dart';

import '../databasepat.dart';


class Ppp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return Listp();
  }
}

class Listp extends State<Ppp> {
  Patientdb helper = Patientdb();
  List<PatMap> PastList;
  int count = 0;
  bool search=false;
  String _timeString;
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {

    if (PastList == null) {
      // ignore: deprecated_member_use
      PastList = List<PatMap>();
      updateListView();
    }
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title:!search ?
        Text("Patient"):TextField(
          onChanged: (value) {
            filterSearchResults(value);
          },
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: 'Patient',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),

        centerTitle: true,
        backgroundColor: Color(0xff353b48),
        elevation: 0,

        actions: [
          search ?
          IconButton(
              icon: Icon(Icons.cancel),
              onPressed:(){
                setState(() {
                  this.search=!this.search;
                  updateListView();

                });

              }
          )
              :IconButton(
              icon: Icon(Icons.search),
              onPressed:(){
                setState(() {
                  this.search=!this.search;
                  updateListView();

                });

              }
          ), // search icon button

          //add more icons here
        ],
      ),
      backgroundColor: Color(0xff353b48),
      body: Container(
        color: Color(0xff353b48),
          child: getNoteListView()),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff4b5468),
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(PatMap('','',0,0,0,1), 'Add Note');
        },

        tooltip: 'Add Note',

        child: Icon(Icons.add),

      ),
    );
  }

  ListView getNoteListView() {
    TextStyle titleStyle = Theme
        .of(context)
        .textTheme
        .subtitle1;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: PastList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          color: Color(0xff4b5468),

          child: ListTile(
            leading: CircleAvatar(
              child: getPriorityIcon(this.PastList[position].priority),
            ),
            title: Text(this.PastList[position].nom,style:TextStyle(color: Colors.white) ,),
            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.white,),
              onTap: () {
                _delete(context, PastList[position]);
              },
            ),


            // onTap: () {
            //   debugPrint("ListTile Tapped");
            //   navigateToDetail(this.noteList[position], 'Edit Note');
            // },

          ),
        );
      },
    );
  }


  // Returns the priority icon
  Image getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Image.asset("images/kk.png");
        break;
      case 2:
        return  Image.asset("images/ww.png");
        break;

      default:
        return  Image.asset("images/kk.png");
    }
  }
  void _delete(BuildContext context, PatMap past) async {
    int result = await helper.deleteNote(past.id);
    if (result != 0) {
      _showSnackBar(context, 'Patient Deleted Successfully');
      updateListView();
    }
  }
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }
  void updateListView() {

    final Future<Database> dbFuture = helper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<PatMap>> PastListFuture = helper.getNoteList();
      // ignore: non_constant_identifier_names
      PastListFuture.then((PastList) {
        setState(() {
          this.PastList = PastList;
          this.count = PastList.length;
        });
      });
    });
  }
  filterSearchResults(String query) {
    List<PatMap> SearchList = [];
    SearchList.addAll(PastList);
    List<PatMap> ListData = [];
    if (query.isNotEmpty) {
      List<PatMap> ListData = [];
      SearchList.forEach((item) {
        if (item.nom.toString().contains(query)) {
          ListData.add(item);
        }
      });
      setState(() {
        PastList.clear();
        PastList.addAll(ListData);

      });
      return;
    }
    else {
      setState(() {
        PastList.clear();
        PastList.addAll(ListData);
      });
    }
  }
  void navigateToDetail(PatMap past, String title) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return Addpas(past);
    }));

    if (result == true) {
      updateListView();
    }
  }




}
