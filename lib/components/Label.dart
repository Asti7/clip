import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  Label({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
      color: Color(0xff393b44),
    );
  }
}
