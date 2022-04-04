import 'package:employeen/assets/text_colors.dart';
import 'package:employeen/pages/employee_detail_page.dart';
import 'package:flutter/material.dart';

class EmployeeTile extends StatelessWidget {
  Map<String, dynamic>? employeeData;
  EmployeeTile({this.employeeData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
          child: Hero(
        tag: 'avatar',
        child:Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
              border:
              Border.all(color: textColorSecondary, width: 5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 16,
                  offset: Offset(3, 6),
                ),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(employeeData!["profile_image"]),
          ),
        ),
      )),
      title: Text(
        employeeData!["name"].toString(),
        style: TextStyle(
            fontSize: 18,
            color: textColorPrimary,
            fontFamily: 'poppins',
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      ),
      subtitle: Text('@${employeeData!["username"].toString()}'),
      contentPadding: const EdgeInsets.only(
        left: 30,
      ),
      dense: false,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return  EmployeeDetails(employeeData : employeeData);
        }));
      },
    );
  }
}
