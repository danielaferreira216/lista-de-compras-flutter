import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';  // Importação necessária para path_provider
import 'dart:io';  // Importação necessária para o uso de Directory

class DatabaseHelper {
  static final DatabaseHelper db = DatabaseHelper();
  Database? _database;  // Torna o Database nullable

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();  // Usa path_provider para encontrar o diretório adequado
    String path = join(documentsDirectory.path, 'app_database.db');
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE,
          password TEXT
        )
      ''');
    });
  }

  Future<bool> newUser(String email, String password) async {
    final Database db = await database;
    try {
      await db.insert('Users', {'email': email, 'password': password});
      return true;
    } catch (e) {
      return false; // Retorna false se houver erro (usuário já existe, por exemplo)
    }
  }

  Future<bool> login(String email, String password) async {
    final Database db = await database;
    var res = await db.query('Users', where: "email = ? AND password = ?", whereArgs: [email, password]);
    return res.isNotEmpty;
  }
}
