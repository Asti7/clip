import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;

  RoundedButton({this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      color: color,
      onPressed: () {},
      minWidth: 200,
      // height: 40,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
