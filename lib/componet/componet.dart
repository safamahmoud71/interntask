import 'package:flutter/material.dart';
class DefaultFormFeild extends StatelessWidget {
  DefaultFormFeild({
    required this.hintText,
    required this.Text


  });
  String hintText;
  TextEditingController Text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Text,
      decoration: InputDecoration(

        fillColor: Colors.white,
        hintText: '$hintText',

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
    );
  }
}

class ExpandableCard extends StatelessWidget {
  final bool isExpanded;
  final void onPressed;

  const ExpandableCard({
    required this.isExpanded,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          children: [
            ListTile(
              title: Text('Title'),
              trailing: IconButton(
                icon: Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more, size: 35,),
                onPressed: () {
                  onPressed;

                },
              ),
            ),
            if (isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text('Additional Data 1'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}