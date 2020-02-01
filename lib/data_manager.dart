import 'dart:math';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataManager {
  Future<Database> _database;

  _getDatabase() async {
    if (this._database == null) {
      this._database = openDatabase(
        join(await getDatabasesPath(), 'data3.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE words(text TEXT)",
          );
        },
        version: 1,
      );
    }

    return this._database;
  }

  addWord(String text) async {
    final Database database = await _getDatabase();
    await database.insert('words', {'text': text});
  }

  Future<List<String>> getWords() async {
    final Database database = await _getDatabase();
    final List<Map<String, dynamic>> maps = await database.query('words', columns: ['text']);
    final List<String> words = List.generate(maps.length, (i) => maps[i]['text']);

    return words;
  }
}