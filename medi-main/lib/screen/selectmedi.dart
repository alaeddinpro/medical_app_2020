import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/modules/meddi.dart';
import 'package:sqflite/sqflite.dart';
import '../bil.dart';
import '../database.dart';
import 'medi_detail.dart';

class GGg extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return MediListState();
  }
}

class MediListState extends State<GGg> {

  TextEditingController cntrtitle=TextEditingController();
  bool search=false;
  DatabaseHelper databaseHelper = DatabaseHelper();
  Note note;
  List<Note> noteList;
  int count = 0;
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
        Text("list"):TextField(
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
              hintText: 'Medi',
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

      body:

      getNoteListView(),

    );
  }

  ListView getNoteListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
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

            subtitle: Text('${noteList[position].min}-${noteList[position].max}-${noteList[position].dosage}/'
                '${noteList[position].min1}-${noteList[position].max1}-${noteList[position].dosage1}/'
                '${noteList[position].min2}-${noteList[position].max2}-${noteList[position].dosage2}'),

            onTap: () {
              debugPrint("ListTile Tapped");


              int w=noteList[position].min;
              int w1=noteList[position].max;
              int w2=noteList[position].dosage;
              int w3=noteList[position].min1;
              int w4=noteList[position].max1;
              int w5=noteList[position].dosage1;
              int w6=noteList[position].min2;
              int w7=noteList[position].max2;
              int w8=noteList[position].dosage2;
                Bil(w,w1,w2,w3,w4,w5,w6,w7,w8);
              moveToLastScreen();
            },

          ),
        );
      },
    );

  }


  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
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
 void  Search() async {
    note.title=cntrtitle.text as String;
    await databaseHelper.chercherMed(note.title);
  }
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
//search medicam
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