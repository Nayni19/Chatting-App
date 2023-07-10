import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;

  const CustomButton({
    Key? key, required this.onPressed, required this.buttonText, required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText
          ),
        ),
      ),
    );
  }
}
