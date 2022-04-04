import 'package:employeen/assets/text_colors.dart';
import 'package:employeen/providers/db_provider.dart';
import 'package:employeen/providers/employee_provider.dart';
import 'package:employeen/widgets/employee_tile.dart';
import 'package:employeen/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    ///check flag

    ///api call
    Provider.of<EmployeeProvider>(context, listen: false)
        .getEmployees()
        .then((value) =>
            Provider.of<DatabaseConnectionProvider>(context, listen: false)
                .insertDatabase(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Team',
          style: TextStyle(
              color: textColorPrimary, fontSize: 28, fontFamily: 'poppinsBold'),
        ),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: FutureBuilder(
              future:
                  Provider.of<DatabaseConnectionProvider>(context).getData(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> data =
                      snapshot.data as List<Map<String, dynamic>>;
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EmployeeTile(employeeData: data[index]);
                      });
                } else {
                  return const SizedBox(
                    child: Text('No Data Found!'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
