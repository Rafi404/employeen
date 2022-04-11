import 'package:emplo/assets/text_colors.dart';
import 'package:emplo/providers/db_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    print("rebuild");

    var dbPro = Provider.of<DatabaseConnectionProvider>(
      context,
    );
    return TextFormField(
      controller: dbPro.contr,
      // validator: (){},
      // onSaved: buttonActionSave,
      onChanged: (value) {
        dbPro.onTextChange(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: textColorPrimary,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.white,
        filled: true,
        focusColor: Colors.transparent,
        hintText: 'Type User name here',
        hintStyle: TextStyle(
          color: textColorPrimary,
          fontFamily: 'poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
