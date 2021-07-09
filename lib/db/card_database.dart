import 'package:card_wallet/model/card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CardesDatabase {
  static final CardesDatabase instance = CardesDatabase._init();

  static Database? _database;

  CardesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('cardes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableCardes ( 
  ${CardeFields.id} $idType, 
  ${CardeFields.isImportant} $boolType,
  ${CardeFields.number} $integerType,
  ${CardeFields.title} $textType,
  ${CardeFields.description} $textType,
  ${CardeFields.time} $textType,
  ${CardeFields.cardHolderName} $textType,
  ${CardeFields.cardNumber} $textType,
  ${CardeFields.company} $textType,
  ${CardeFields.thruMonth} $integerType,
  ${CardeFields.thruYear} $integerType,
  ${CardeFields.fromMonth} $integerType,
  ${CardeFields.fromYear} $integerType,
  )
''');
  }

  Future<Carde> create(Carde carde) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableCardes, carde.toJson());
    return carde.copy(id: id);
  }

  Future<Carde> readCarde(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableCardes,
      columns: CardeFields.values,
      where: '${CardeFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Carde.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Carde>> readAllCardes() async {
    final db = await instance.database;

    final orderBy = '${CardeFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableCardes, orderBy: orderBy);

    return result.map((json) => Carde.fromJson(json)).toList();
  }

  Future<int> update(Carde carde) async {
    final db = await instance.database;

    return db.update(
      tableCardes,
      carde.toJson(),
      where: '${CardeFields.id} = ?',
      whereArgs: [carde.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCardes,
      where: '${CardeFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
