import 'package:flutter_krustypos/data/models/response/product_response_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();
  final String tableProduct = 'products';

  static Database? _database;

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableProduct (
        id INTEGER PRIMARY KEY,
        productId INTEGER,
        categoyId INTEGER,
        categoryName TEXT,
        name TEXT,
        description TEXT,
        image TEXT,
        price TEXT,
        stock INTEGER,
        status INTEGER,
        isDavorite INTEGER,
        createdAt TEXT,
        updatedAt TEXT
      )
    ''');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = '$dbPath/$filePath';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('dbresto.db');
    return _database!;
  }

  Future<void> insertProducts(Product product) async {
    final db = await instance.database;
    await db.insert(
      tableProduct,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableProduct);
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await instance.database;
    await db.update(
      tableProduct,
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> deleteAllProducts() async {
    final db = await instance.database;
    await db.delete(tableProduct);
  }
}
