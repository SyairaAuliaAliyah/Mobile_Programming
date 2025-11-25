import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _db;

  DatabaseHelper._();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), "auth.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT
          )
        """);

        await db.insert("users", {
          "username": "admin",
          "password": "12345",
        });
      },
    );
  }

  Future<bool> login(String username, String password) async {
    final database = await db;
    final result = await database.query(
      "users",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );
    return result.isNotEmpty;
  }
}
