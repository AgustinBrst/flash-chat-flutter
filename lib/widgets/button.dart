import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String text;

  const Button({
    @required this.color,
    @required this.onPressed,
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
