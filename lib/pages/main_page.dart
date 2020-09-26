import 'package:clip/components/Label.dart';
import 'package:clip/components/Tile.dart';
import 'package:flutter/cupertino.dart';
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
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.0)), //this right here
                              child: Container(
                                height: 250,
                                width: 400,
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Title/Note:   '),
                                            Container(
                                              width: 250,
                                              child: CupertinoTextField(
                                                placeholder: 'Enter note/title',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text('Links:   '),
                                            Container(
                                              width: 250,
                                              child: CupertinoTextField(
                                                placeholder:
                                                    'Enter relevant link(s)',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              elevation: 5,
                                              color: Colors.green,
                                              onPressed: () {},
                                              minWidth: 80,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Save',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    elevation: 5,
                    color: Colors.green,
                    child: Tooltip(
                      message: 'Add application',
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Tile();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
