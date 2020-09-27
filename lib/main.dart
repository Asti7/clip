import 'package:clip/model/application_data.dart';
import 'package:clip/pages/login.dart';
import 'package:clip/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Clip());
}

class Clip extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Login.id,
        routes: {
          Login.id: (context) => Login(),
          MainPage.id: (context) => MainPage()
        },
      ),
    );
  }
}
