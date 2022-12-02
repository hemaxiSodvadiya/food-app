import 'dart:developer';

import 'package:food_app/model/food_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodHelper {
  FoodHelper._();
  static final FoodHelper foodHelper = FoodHelper._();

  String tableName = "products";

  String colId = "id";
  String colName = "name";
  String colPrice = "price";
  String colImage = "image";
  String colQuantity = "quantity";
  String colPrices = "prices";
  String colIsLike = "isLike";

  Database? db;
  // Todo: initDB
  Future<Database> initDatabase() async {
    var db = await openDatabase("food.db");

    String dataBasePath = await getDatabasesPath();

    String path = join(dataBasePath, "food.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int vision) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colName TEXT,$colPrice REAL,$colQuantity INTEGER,$colPrices REAL,$colImage BLOB,$colIsLike TEXT);");
      },
    );
    return db;
  }

  // Todo: insertData
  Future<int> insertData({required FoodModel data}) async {
    db = await initDatabase();

    String query = "INSERT INTO $tableName VALUES (?, ?, ?, ?, ?, ?,?);";
    List arg = [
      data.id,
      data.name,
      data.price,
      data.quantity,
      data.prices,
      data.image,
      data.isLike,
    ];

    return await db!.rawInsert(query, arg);
  }

// Todo: fetchAllData
  Future<List<FoodModel>> fetchAllData() async {
    db = await initDatabase();

    String query = "SELECT * FROM $tableName";

    List<Map<String, Object?>> res = await db!.rawQuery(query);

    log(res.toString(), name: "res");

    List<FoodModel> productData =
        res.map((e) => FoodModel.fromMap(data: e)).toList();
    log(productData.toString(), name: "Data");

    return productData;
  }

  Future<int> deleteAllData() async {
    db = await initDatabase();

    String query = "DELETE FROM $tableName";

    return await db!.rawDelete(query);
  }
}
