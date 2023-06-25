// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  Trivel_Dao? _trivel_DaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TrivelInfo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `image` TEXT NOT NULL, `titleNmae` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  Trivel_Dao get trivel_Dao {
    return _trivel_DaoInstance ??= _$Trivel_Dao(database, changeListener);
  }
}

class _$Trivel_Dao extends Trivel_Dao {
  _$Trivel_Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _trivelInfoInsertionAdapter = InsertionAdapter(
            database,
            'TrivelInfo',
            (TrivelInfo item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'titleNmae': item.titleNmae
                },
            changeListener),
        _trivelInfoDeletionAdapter = DeletionAdapter(
            database,
            'TrivelInfo',
            ['id'],
            (TrivelInfo item) => <String, Object?>{
                  'id': item.id,
                  'image': item.image,
                  'titleNmae': item.titleNmae
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrivelInfo> _trivelInfoInsertionAdapter;

  final DeletionAdapter<TrivelInfo> _trivelInfoDeletionAdapter;

  @override
  Future<List<TrivelInfo>> findAllTrivelInfo() async {
    return _queryAdapter.queryList('SELECT * FROM TrivelInfo',
        mapper: (Map<String, Object?> row) => TrivelInfo(
            id: row['id'] as int?,
            image: row['image'] as String,
            titleNmae: row['titleNmae'] as String));
  }

  @override
  Stream<TrivelInfo?> findTrivelInfoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM TrivelInfo WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TrivelInfo(
            id: row['id'] as int?,
            image: row['image'] as String,
            titleNmae: row['titleNmae'] as String),
        arguments: [id],
        queryableName: 'TrivelInfo',
        isView: false);
  }

  @override
  Future<void> insertTrivelInfo(TrivelInfo person) async {
    await _trivelInfoInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletinfo(TrivelInfo person) async {
    await _trivelInfoDeletionAdapter.delete(person);
  }
}
