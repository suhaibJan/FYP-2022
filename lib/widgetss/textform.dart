import 'package:flutter/material.dart';

class textform extends StatefulWidget {
  String? hint ;
   TextEditingController textEditingController;
  //final FormFieldValidator validator;

  textform(this.hint,this.textEditingController,);

  @override
  State<textform> createState() => _textformState();
}

class _textformState extends State<textform> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // validator: widget.validator,
      controller: widget.textEditingController,
      autovalidateMode: AutovalidateMode.always,
     // validator:widget.validator ,
      onChanged: (value) {
        //Do something with the user input.
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.pink.shade100, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Colors.pinkAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );

  }
}
