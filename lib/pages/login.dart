import 'package:clip/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        width: 40,
        height: 40,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          child: Icon(
            Icons.info_outline,
            color: Color(0xff393b44),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0)), //this right here
                    child: Container(
                      height: 200,
                      width: 200,
                      // color: Color(0xff322f3d),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/clip_logo.png',
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Clip'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Clip is a chrome extention which helps you keep track of your Job/Internship applications.'),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
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
            GoogleSignInButton(
              onPressed: () async {
                setState(() {
                  _isProcessing = true;
                  print(_isProcessing);
                });
                await signInWithGoogle().then((result) {
                  print(result);
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, MainPage.id);
                }).catchError((error) {
                  print('Registration Error: $error');
                });
                setState(() {
                  _isProcessing = false;
                  print(_isProcessing);
                });
              },
              borderRadius: 10,
              darkMode: false,
            )
          ],
        ),
      ),
    );
  }
}
