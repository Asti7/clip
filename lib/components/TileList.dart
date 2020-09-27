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
              toApplyPressed: application.toApply,
              acceptedPressed: application.accepted,
              appliedPressed: application.applied,
              rejectedPressed: application.rejected,
              onPressed: () {
                applicationData.deleteApplication(application);
              },
              onPressedToApply: () {
                applicationData.updateApplicationToApply(application);
              },
              onPressedAccepted: () {
                applicationData.updateApplicationAccepted(application);
              },
              onPressedApplied: () {
                applicationData.updateApplicationApplied(application);
              },
              onPressedRejected: () {
                applicationData.updateApplicationRejected(application);
              },
            );
          },
          itemCount: applicationData.applications.length,
        );
      },
    );
  }
}
