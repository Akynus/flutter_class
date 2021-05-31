import 'package:sqflite/sqflite.dart';

class DbConnection {
  static Database _instance;

  static Future<void> openConnection() async {
    _instance = await openDatabase(
      "aula_flutter.db",
      version: 1,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE IF NOT EXISTS person(id INTEGER PRIMARY KEY, name TEXT NOT NULL, address TEXT NOT NULL)",
        );
      },
    );
  }

  static Database get instance {
    return _instance;
  }
}
