import 'package:evcharger/models/appointment_model.dart';
import 'package:flutter/foundation.dart';

// import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize database
  initalDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'evcharger.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 4, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade===========");
  }

  //Create Database Table
  _onCreate(Database db, int version) async {
    await db.execute(''' 
      CREATE TABLE evcharger (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
      carType TEXT NOT NULL,
      stationType TEXT NOT NULL,
      date TEXT NOT NULL,
      startTime TEXT NOT NULL,
      endTime TEXT NOT NULL,
      note TEXT NOT NULL,
      isCompleted INTEGER
      
      )
      ''');
    print("Create EVcharger DATABASE");
  }

  //insert data function
  static Future<int?> insert(Appointment? appointment) async {
    if (_db == null) {
      return null;
    }
    final id = await _db!.insert('evcharger', appointment!.toJson());
    print("Inserted appointment with id: $id");
    return id;
  }

  //retrive data
  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query('evcharger');
  }

  //delete data
  static delete(Appointment appointment) async {
    return await _db!
        .delete('evcharger', where: 'id=?', whereArgs: [appointment.id]);
  }

  //update data
  static update(int id) async {
    return await _db!.rawUpdate('''
    UPDATE evcharger
    SET isCompleted = ?
    WHERE id = ?
    ''', [1, id]);
  }
}
