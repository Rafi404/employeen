import 'package:employeen/assets/text_colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: fieldController,
      // validator: (){},
      // onSaved: buttonActionSave,
      onChanged: (value){
        print(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search,size: 24,color: textColorPrimary,),
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
