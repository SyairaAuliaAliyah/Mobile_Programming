import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/note.dart';

class DatabaseHelper {
  static const _databaseName = "notes.db";
  static const _databaseVersion = 1;
  static const table = 'notes';

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  // READ
  Future<List<Note>> getNotes() async {
    final db = await database;
    final result = await db.query(table, orderBy: 'createdAt DESC');
    return result.map((map) => Note.fromMap(map)).toList();
  }

  // CREATE
  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert(table, note.toMap());
  }

  // UPDATE
  Future<int> updateNote(Note note) async {
    final db = await database;
    return await db.update(
      table,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // DELETE
  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
