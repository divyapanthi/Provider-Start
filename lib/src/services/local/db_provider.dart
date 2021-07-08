import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  Database? _db;

  DbProvider() {
    _init();
  }

  Future<void> _init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(dir.path, DB_NAME);
    _db = await openDatabase(dbPath, version: 1,
        onCreate: (Database newDb, int version) {
      Batch batch = newDb.batch();
      batch.execute("""
            CREATE TABLE $USER_TABLE (
              id TEXT PRIMARY KEY,
              isAdmin INTEGER,
              name TEXT,
              email TEXT,
              phone INTEGER,
              registrationDate TEXT
            )
        """);
      batch.commit();
    });
  }

  Future<int> insertUser(UserModel user) async {
    if (_db == null) await _init();
    return _db!.insert(USER_TABLE, user.toDb());
  }

  Future<UserModel?> getUser() async {
    if (_db == null) await _init();
    final data = await _db!.query(USER_TABLE);
    if (data.length != 1) return null;
    return UserModel.fromDb(data.first);
  }

  Future<void> clear() async {
    if (_db == null) await _init();
    _db!.delete(USER_TABLE);
  }
}
