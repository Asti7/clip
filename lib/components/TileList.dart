import 'package:clip/components/Tile.dart';
import 'package:clip/model/application_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TileList extends StatelessWidget {
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
              onPressed: () {
                applicationData.deleteApplication(application);
              },
            );
          },
          itemCount: applicationData.applications.length,
        );
      },
    );
  }
}
