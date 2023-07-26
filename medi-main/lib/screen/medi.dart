import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medical/modules/meddi.dart';

import 'package:sqflite/sqflite.dart';
import '../database.dart';
import 'medi_detail.dart';


class NoteList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  bool search=false;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      // ignore: deprecated_member_use
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(

        title:!search ?
        Text("Medical"):TextField(
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
            hintText: 'Medical',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),

        centerTitle: true,
        backgroundColor: Color(0xff2198F3),
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
      body: getNoteListView(),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff2198F3),
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', 0, 0, 0, 0, 0, 0, 0, 0, 0), 'Add Note');
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
      itemCount: noteList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          color: Colors.white,

          child: ListTile(

            leading: CircleAvatar(
              backgroundColor: Color(0xff2198F3),
              child: Image.asset("images/m.png"),
              // child: Icon(Icons.local_pharmacy),
            ),

            title: Text(this.noteList[position].title, style: titleStyle,),

            subtitle: Text('${noteList[position].min}-${noteList[position]
                .max}-${noteList[position].dosage}/'
                '${noteList[position].min1}-${noteList[position]
                .max1}-${noteList[position].dosage1},'
                '/${noteList[position].min2}-${noteList[position]
                .max2}-${noteList[position].dosage2}',),

            trailing: GestureDetector(
              child:Icon(Icons.delete, color: Color(0xff2198F3),),
              onTap: () {
                _delete(context, noteList[position]);
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

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note);
    }));

    if (result == true) {
      updateListView();
    }
  }
  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
  filterSearchResults(String query) {
    List<Note> SearchList = [];
    SearchList.addAll(noteList);
    List<Note> ListData = [];
    if (query.isNotEmpty) {
      List<Note> ListData = [];
      SearchList.forEach((item) {
        if (item.title.toString().contains(query)) {
          ListData.add(item);
        }
      });
      setState(() {
        noteList.clear();
        noteList.addAll(ListData);

      });
      return;
    }
    else {
      setState(() {
        noteList.clear();
        noteList.addAll(ListData);
      });
    }
  }
}