import 'package:clip/pages/login.dart';
import 'package:clip/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Clip());
}

class Clip extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => Login(),
        MainPage.id: (context) => MainPage()
        // WelcomeScreen.id: (context) => WelcomeScreen(),
        // LoginScreen.id: (context) => LoginScreen(),
        // RegistrationScreen.id: (context) => RegistrationScreen(),
        // ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
