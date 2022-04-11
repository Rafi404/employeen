import 'package:employeen/model/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnectionProvider with ChangeNotifier {
  DatabaseConnectionProvider() {
    setDatabase();
  }

  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'emploee_db_sqflite');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  ///Create Database
  _onCreatingDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE employees(id INTEGER, name TEXT, "
        "username TEXT, email TEXT, profile_image TEXT, street TEXT, suite TEXT, city TEXT, "
        "zipcode TEXT, geo_lat text, geo_lng TEXT, phone TEXT, website TEXT, company_name TEXT,"
        " catchPhrase TEXT, bs TEXT)");
  }

  ///Insert data into the database
  insertDatabase(List<EmployeeList> value) async {
    Database db = await setDatabase();
    value.forEach((element) async {
      db.rawInsert(
          'INSERT INTO employees(id, name, username, email, profile_image, street, suite, city, zipcode, '
          'geo_lat, geo_lng, phone, website, company_name, catchPhrase, bs )'
          ' VALUES("${element.id}","${element.name}", "${element.username}", "${element.email}", "${element.profileImage}",'
          ' "${element.street}", "${element.suite}", "${element.city}", "${element.zipCode}", "${element.locationLat}", '
          '"${element.locationLng}",'
          ' "${element.phone}", "${element.website}", "${element.company}", "${element.catchPhrase}", "${element.bs}" )');
      return;
    });
  }

  ///Select Data from table
  Future<List<Map<String, dynamic>>?> getData() async {
    Database db = await setDatabase();
    List<Map<String, dynamic>> data = await db.query("employees");
    // print('data from table$data');
    return data;
  }
}
