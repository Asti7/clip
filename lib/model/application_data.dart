import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:clip/model/application.dart';

class ApplicationData extends ChangeNotifier {
  List<Application> _applications = [];

  List<Application> get applications {
    return _applications;
  }

  set applications(List<Application> applications) {
    _applications = applications;
  }

  void addApplication(String title, String link) {
    final application = Application(title: title, link: link);
    _applications.add(application);
    notifyListeners();
  }

  void updateApplicationToApply(Application application) {
    application.toggleToApply();
    notifyListeners();
  }

  void updateApplicationApplied(Application application) {
    application.toggleApplied();
    notifyListeners();
  }

  void updateApplicationRejected(Application application) {
    application.toggleRejected();
    notifyListeners();
  }

  void updateApplicationAccepted(Application application) {
    application.toggleAccepted();
    notifyListeners();
  }

  void deleteApplication(Application application) {
    _applications.remove(application);
    notifyListeners();
  }
}
