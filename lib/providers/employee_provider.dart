import 'dart:convert';

import 'package:employeen/model/employee_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class EmployeeProvider with ChangeNotifier {
  bool webDataStatus = true;

  ///Table creation

  ///Getting Data from API
  Future<List<EmployeeList>> getEmployees() async {
    var backendUrl = "http://www.mocky.io/v2/5d565297300000680030a986";
    var data = await http.get(Uri.parse(backendUrl));
    var jsonData = json.decode(data.body);
    var employeeData = jsonData;

    ///Save webData status
    const storage = FlutterSecureStorage();
    await storage.write(key: "webDataStatus", value: webDataStatus.toString());
    var dataStatus = storage.read(key: "webDataStatus");
    print(dataStatus);

    print('eeeeee');
    List<EmployeeList> employee = [];
    for (var i in employeeData) {
      try {
        EmployeeList allEmployee = EmployeeList(
            id: i["id"].toString(),
            name: i["name"],
            username: i["username"],
            email: i["email"] ?? '',
            profileImage: i["profile_image"],
            street: i["address"]["street"],
            suite: i["address"]["suite"],
            city: i["address"]["city"],
            zipCode: i["address"]["zipcode"],
            locationLat: i["address"]["geo"]["lat"],
            locationLng: i["address"]["geo"]["lng"],
            phone: i["phone"],
            website: i["website"],
            company: i["company"]?["name"],
            catchPhrase: i["company"]?["catchPhrase"],
            bs: i["company"]?["bs"]);
        // print(allEmployee);
        employee.add(allEmployee);
      } catch (e) {
        print(e);
      }
    }
    return employee;
  }

  ///Read data status
  Future<bool> getDataStatus() async {
    const storage = FlutterSecureStorage();
    bool dataStatus = (await storage.read(key: "webDataStatus")) as bool;
    // print('eeeeeeee${dataStatus.toString()}');
    notifyListeners();
    return dataStatus;
  }
}
