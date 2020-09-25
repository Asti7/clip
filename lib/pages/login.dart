import 'package:clip/components/RoundedButton.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static const String id = 'login';

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
                              Text('Clip')
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
