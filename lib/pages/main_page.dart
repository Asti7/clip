import 'dart:convert';

import 'package:clip/components/Label.dart';
import 'package:clip/components/Tile.dart';
import 'package:clip/components/TileList.dart';
import 'package:clip/model/application.dart';
import 'package:clip/model/application_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  static const String id = 'main_page';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  static SharedPreferences prefs;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> userList = Provider.of<ApplicationData>(context, listen: false)
        .applications
        .map((item) => jsonEncode(item.toMap()))
        .toList();

    prefs.setStringList('userList', userList);
  }

  void loadData() {
    List<String> userList = prefs.getStringList('userList');
    Provider.of<ApplicationData>(context, listen: false).applications =
        userList.map((item) => Application.fromMap(jsonDecode(item))).toList();
    setState(() {});
  }

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
              saveData();
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
                                                controller: titleController,
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
                                                controller: linkController,
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
                                              onPressed: () {
                                                if (titleController.text ==
                                                    '') {
                                                  titleController.text = '!';
                                                } else {
                                                  Provider.of<ApplicationData>(
                                                          context,
                                                          listen: false)
                                                      .addApplication(
                                                          titleController.text,
                                                          linkController.text);
                                                  saveData();

                                                  titleController.text = '';
                                                  linkController.text = '';
                                                  Navigator.pop(context);
                                                }
                                              },
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
                  ),
                  RawMaterialButton(
                      shape: CircleBorder(),
                      elevation: 5,
                      child: Tooltip(
                        padding: EdgeInsets.all(8),
                        message:
                            'Data is stored in browser cache,\nif you clear the cache all data is lost.',
                        child: Icon(
                          Icons.info_sharp,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                      onPressed: () {}),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: TileList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
