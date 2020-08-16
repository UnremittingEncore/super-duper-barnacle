import 'dart:io';
import 'dart:math';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{
  String TAG = "DatabaseHelper";
  Logger logger = new Logger();
  static final databaseName = "CustomUserInformation.db";
  static final databaseTable = "Users";
  static final databaseVersion = 1;

  static final columnId = "id";
  static final columnname = "name";
  static final columnAge = "age";
  static final columnAddress1 = "AddressLine_1";

  DatabaseHelper._privateConstructor();

  static Database _database;

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    else{
      //Initialise the database -> This is lazy initialisation
      logger.d(TAG , "Initialising the database");
      _database = await initDatabase();
      return _database;
    }
  }


  initDatabase() async{
    logger.d(TAG , "Inside initialise database creating the path for database");
    Directory databaseDirectory = await getApplicationDocumentsDirectory();
    String path = join(databaseDirectory.path, databaseName);
    return await openDatabase(path, version: databaseVersion, onCreate: onCreateDatabaseTable );
  }

  onCreateDatabaseTable(Database database, int version) async{
    logger.d(TAG , "Creating users table  ");
    String createTablequery = "CREATE TABLE $databaseTable($columnId INTEGER PRIMARY KEY,$columnname TEXT NOT NULL,$columnAge INTEGER NOT NULL,$columnAddress1 TEXT NOT NULL)";
    return await database.execute(createTablequery);
  }


  Future<int> insertData(Map<String, dynamic> row) async{
    Database database = await instance.database;
    return await database.insert(databaseTable, row);
  }


  Future<int> updateData(Map<String, dynamic> row) async{
    Database database = await instance.database;
    int id = row[columnId];
    return await database.update(databaseTable, row, where : '$columnId = ?', whereArgs: [id]);
  }


  Future<List<Map<String, dynamic>>> queryEntireTable() async{
    Database database = await instance.database;
    return await database.query(databaseTable);
  }

  Future<int> deleteData(int rowid) async{
    Database database = await instance.database;
    return await database.delete(databaseTable, where : '$columnId = ?', whereArgs: [rowid]);
  }





}