import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'modules/meddi.dart';


class DatabaseHelper {

  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String tableMed = 'table_Med';
  String colId = 'id';
  String colTitle = 'title';
  String colMin= 'min';
  String colMax= 'max';
  String colDosage= 'dosage';
  String colMin1= 'min1';
  String colMax1= 'max1';
  String colDosage1= 'dosage1';
  String colMin2= 'min2';
  String colMax2= 'max2';
  String colDosage2= 'dosage2';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    String directory = await getDatabasesPath();
    String path = join(directory,'medi.db');

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $tableMed($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT,'
        '$colMin INTEGER, $colMax INTEGER, $colDosage INTEGER,'
        '$colMin1 INTEGER, $colMax1 INTEGER, $colDosage1 INTEGER,'
        '$colMin2 INTEGER, $colMax2 INTEGER, $colDosage2 INTEGER)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(tableMed,);
    return result.toList();
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.insert(tableMed, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(Note note) async {
    var db = await this.database;
    var result = await db.update(tableMed, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $tableMed WHERE $colId = $id');
    return result;
  }
  Future getNote(int id) async {
    List result = await _database.query(tableMed,
        columns: [colId, colMin, colMax,colDosage,colMin1,colMax1,colDosage1, colMin2, colMax2,colDosage2],
        where: '$colId = ?', whereArgs: [id]);

    if (result.length > 0) {
      return new Note.fromMapObject(result.first);
    }

    return null;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $tableMed');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {

    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    // ignore: deprecated_member_use
    List<Note> noteList = List<Note>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
  //chercher un medicament
  Future<Note> chercherMed(String nom) async {
    Database db = await this.database;
    var result = await db.query(
      tableMed,
      where: "title LIKE ?",
      whereArgs: ['%$nom%'],
    );
    if (result.length == 0) return null;
    return new Note.fromMapObject(result.first);
  }
    Future Close() async {
    var db = await database;
    return await db.close();
  }
}