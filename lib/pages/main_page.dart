import 'package:clip/components/Label.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  static const String id = 'main_page';

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
            child: Tooltip(
              message: 'Logout',
              child: Icon(
                Icons.logout,
                color: Color(0xff393b44),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'images/clip_logo.png',
                height: 40,
                width: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(text: 'Your list of applications'),
                  MaterialButton(
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    onPressed: () {},
                    elevation: 5,
                    color: Colors.green,
                    child: Tooltip(
                      message: 'Add application',
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
