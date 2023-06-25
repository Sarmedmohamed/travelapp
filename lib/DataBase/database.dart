import 'package:floor/floor.dart';
import 'Trivel_Dao.dart';
import 'Trivel_Info.dart';

import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [TrivelInfo])
abstract class AppDataBase extends FloorDatabase {
  Trivel_Dao get trivel_Dao;
}