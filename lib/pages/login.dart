import 'package:clip/pages/main_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // bool _isProcessing = false;
  bool isSpinning = false;

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
            MaterialButton(
              minWidth: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
              onPressed: () {
                Navigator.pushNamed(context, MainPage.id);
              },
              color: Colors.green,
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
