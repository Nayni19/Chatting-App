import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String hintTextVal;
  final Color colorVal;
  final Function onChangeHandler;
  final TextInputType keyboard;
  final bool obscure;
  
  const CustomTextField({
    Key? key, required this.hintTextVal, required this.colorVal, required this.onChangeHandler, required this.keyboard, required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        onChangeHandler(value);
      },
      style: TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
      keyboardType: keyboard,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hintTextVal,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: colorVal, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: colorVal, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}