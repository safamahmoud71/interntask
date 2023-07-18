import 'package:flutter/material.dart';
import 'package:interntask/componet/componet.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
      TextFormField(
      decoration: InputDecoration(
      fillColor: Colors.white,
        hintText: 'Enter Search here...',
        prefixIcon: Icon(Icons.search, color: Color(0xff979797),),
        hintStyle: TextStyle(
          fontSize: 10.0,
          color: Color(0xffB1B1B1),
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),

        ],
      ),
    );
  }
}
