import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:sqllitemaybe/common/data_base_request.dart';
import 'package:sqllitemaybe/data/model/role.dart';
import 'package:sqllitemaybe/domain/entity/role_entity.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  final int _version = 2;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'test1.db');

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      database = await databaseFactory.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
              version: _version,
              onCreate: (db, version) => onCreateTable(
                    db,
                  ),
              onUpgrade: ((db, oldVersion, newVersion) => onUpdateTable(db))));
    } else {
      database = await openDatabase(
        _pathDB,
        version: _version,
        onCreate: (db, version) => onCreateTable(db),
        onUpgrade: (db, oldVersion, newVersion) => onUpdateTable(db),
      );
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableList.reversed) {
      if (tables.where((element) => element['name'] == table).isNotEmpty) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreate in DataBaseRequest.tableCreateList) {
      await db.execute(tableCreate);
    }

    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      for (var element in RoleEnum.values) {
        db.insert(
          DataBaseRequest.tableRole,
          Role(name: element.name).toMap(),
        );
      }
    } on DatabaseException catch (error) {}
  }

  Future<void> onDropDataBase() async {
    database.close();
    deleteDatabase(_pathDB);
  }
}
