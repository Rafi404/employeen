import 'package:employeen/assets/text_colors.dart';
import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final IconData tileIcon;
  final String tileTitle;
  final String tileSubTitle;

  const DataTile(
      {Key? key,
      required this.tileIcon,
      required this.tileTitle,
      required this.tileSubTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.16),
                blurRadius: 25,
                offset: const Offset(0, 10),
              )
            ],
            color: bgColor),
        child: ListTile(
          leading: Icon(
            tileIcon,
            size: 25,
            color: textColorPrimary,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tileTitle,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    color: textColorSecondary,
                    letterSpacing: .6),
              ),
              Text(
                tileSubTitle,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    color: textColorPrimary,
                    letterSpacing: .6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
