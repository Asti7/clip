import 'package:flutter/foundation.dart';

class Application {
  final String title;
  final String link;
  bool toApply;
  bool applied;
  bool rejected;
  bool accepted;

  Application(
      {@required this.title,
      @required this.link,
      this.accepted = false,
      this.applied = false,
      this.rejected = false,
      this.toApply = false});

  void toggleToApply() {
    toApply = !toApply;
  }

  void toggleApplied() {
    applied = !applied;
  }

  void toggleRejected() {
    rejected = !rejected;
  }

  void toggleAccepted() {
    accepted = !accepted;
  }
}
