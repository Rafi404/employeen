import 'package:emplo/assets/text_colors.dart';
import 'package:emplo/providers/db_provider.dart';
import 'package:emplo/providers/employee_provider.dart';
import 'package:emplo/widgets/employee_tile.dart';
import 'package:emplo/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

    // print("print");
    //  Provider.of<EmployeeProvider>(context, listen: false).getEmployees();

    //checkDataStatus();
  }

  @override
  Widget build(BuildContext context) {
    var homPro = Provider.of<EmployeeProvider>(
      context,
    );
    var dbPro = Provider.of<DatabaseConnectionProvider>(
      context,
    );

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
              child: dbPro.contr.text.isEmpty
                  ? FutureBuilder(
                      future: Provider.of<DatabaseConnectionProvider>(context,
                              listen: false)
                          .getData(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data);
                          print("future");
                          List<Map<String, dynamic>> data =
                              snapshot.data as List<Map<String, dynamic>>;
                          print(data.length.toString() + "  length");
                          return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return EmployeeTile(employeeData: data[index]);
                              });
                        } else {
                          return const SizedBox(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                      },
                    )
                  : ListView.builder(
                      itemCount: dbPro.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return EmployeeTile(employeeData: dbPro.data[index]);
                      })),
        ],
      ),
    );
  }

  checkDataStatus() async {
    var dataStatus = await Provider.of<EmployeeProvider>(context, listen: false)
        .getDataStatus();
    if (dataStatus == null) {
      Provider.of<EmployeeProvider>(context, listen: false)
          .getEmployees()
          .then((value) async {
        return await Provider.of<DatabaseConnectionProvider>(context,
                listen: false)
            .insertDatabase(value);
      });
      // .then(
      //   (value) async{
      //     return await Provider.of<DatabaseConnectionProvider>(context, listen: false)
      //           .getData();
      //   },
      // );

      print("getdata");

      // setState(() {
      //   Provider.of<DatabaseConnectionProvider>(context, listen: false)
      //       .getData();
      // });
    }
  }
}
