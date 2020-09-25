import 'package:clip/components/RoundedButton.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff322f3d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/clip_logo.png',
              height: 100,
              width: 100,
            ),
            SizedBox(
              height: 50,
            ),
            RoundedButton(
              color: Color(0xff393b44),
              text: 'Login',
            ),
            SizedBox(
              height: 10,
            ),
            RoundedButton(
              color: Color(0xff393b44),
              text: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
