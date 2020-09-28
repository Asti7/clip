import 'dart:convert';

import 'package:clip/components/Tile.dart';
import 'package:clip/model/application.dart';
import 'package:clip/model/application_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TileList extends StatefulWidget {
  @override
  _TileListState createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  SharedPreferences prefs;
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
    return Consumer<ApplicationData>(
      builder: (context, applicationData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final application = applicationData.applications[index];
            return Tile(
              title: application.title,
              link: application.link,
              toApplyPressed: application.toApply,
              acceptedPressed: application.accepted,
              appliedPressed: application.applied,
              rejectedPressed: application.rejected,
              onPressed: () {
                applicationData.deleteApplication(application);
                saveData();
              },
              onPressedToApply: () {
                applicationData.updateApplicationToApply(application);
                saveData();
              },
              onPressedAccepted: () {
                applicationData.updateApplicationAccepted(application);
                saveData();
              },
              onPressedApplied: () {
                applicationData.updateApplicationApplied(application);
                saveData();
              },
              onPressedRejected: () {
                applicationData.updateApplicationRejected(application);
                saveData();
              },
            );
          },
          itemCount: applicationData.applications.length,
        );
      },
    );
  }
}
