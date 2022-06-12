import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final String databaseName = "Activities.sqlite";

  static Future<Database> accessToDB() async {
    String pathOfDB = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(pathOfDB)) {
      print("DB exist!");
    } else {
      ByteData data = await rootBundle.load("database/${databaseName}");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(pathOfDB).writeAsBytes(bytes, flush: true);
      print("DB copied!");
    }

    return openDatabase(pathOfDB);
  }
}
