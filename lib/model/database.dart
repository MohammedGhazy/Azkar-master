import 'package:azkarapp/model/my_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'userText.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE userText (id INTEGER PRIMARY KEY, name TEXT)');
  }

  Future<User> add(User user) async {
    var dbClient = await db;
    user.id = await dbClient.insert('userText', user.toMap());
    return user;
  }

  Future<List<User>> getStudents() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('userText', columns: ['id', 'name']);
    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.fromMap(maps[i]));
      }
    }
    return users;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'userText',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(User student) async {
    var dbClient = await db;
    return await dbClient.update(
      'userText',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}