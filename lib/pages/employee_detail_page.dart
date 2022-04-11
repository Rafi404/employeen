
import 'package:emplo/assets/text_colors.dart';
import 'package:emplo/pages/home_page.dart';
import 'package:emplo/widgets/data_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class EmployeeDetails extends StatelessWidget {
  Map<String, dynamic>? employeeData;
  EmployeeDetails({this.employeeData});

  @override
  Widget build(BuildContext context) {
    ///custom spacing for UI elements

    Widget smSpace = const SizedBox(
      height: 15,
    );

    Widget bgSpace = const SizedBox(
      height: 30,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          },
          icon: Icon(
            Icons.arrow_back,
            color: textColorPrimary,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            employeeData!["name"],
            style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 20,
                color: textColorPrimary,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          ),
          CircleAvatar(
            radius: 50,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: textColorSecondary,
                  border: Border.all(color: textColorSecondary, width: 5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 16,
                      offset: Offset(3, 6),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                 child:employeeData?["profile_image"].toString()=="null"?Text(""): Hero

                   (tag: "avatar",
                     child: Image.network(employeeData!["profile_image"])),
              ),
            ),
          ),
          smSpace,
          Text(
            '@${employeeData!["username"]}',
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                color: textColorSecondary,
                letterSpacing: .6),
          ),
          Text(
            employeeData!["email"],
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'poppins',
                fontWeight: FontWeight.bold,
                color: textColorPrimary,
                letterSpacing: .6),
          ),
          smSpace,
          Expanded(
            child: ListView(
              children: [
                DataTile(
                  tileSubTitle: employeeData!["phone"] ?? '',
                  tileTitle: 'Phone',
                  tileIcon: Icons.phone_iphone,
                ),
                DataTile(
                  tileSubTitle: employeeData!["website"],
                  tileTitle: 'Website',
                  tileIcon: Icons.language,
                ),
                DataTile(
                  tileSubTitle: employeeData!["company_name"],
                  tileTitle: 'Company',
                  tileIcon: Icons.business,
                ),
                DataTile(
                  tileSubTitle: employeeData!["street"],
                  tileTitle: 'Street',
                  tileIcon: Icons.traffic_outlined,
                ),
                DataTile(
                  tileSubTitle: employeeData!["suite"],
                  tileTitle: 'Suite',
                  tileIcon: Icons.airline_seat_individual_suite_outlined,
                ),
                DataTile(
                  tileSubTitle: employeeData!["city"],
                  tileTitle: 'City',
                  tileIcon: Icons.location_city_outlined,
                ),
                DataTile(
                  tileSubTitle: employeeData!["zipcode"],
                  tileTitle: 'Zip Code',
                  tileIcon: Icons.markunread_mailbox_outlined,
                ),
                const DataTile(
                  tileSubTitle: '',
                  tileTitle: 'Location',
                  tileIcon: Icons.location_on_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
