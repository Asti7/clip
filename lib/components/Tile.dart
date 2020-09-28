import 'package:clip/pages/main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tile extends StatefulWidget {
  final String title;
  final String link;
  final Function onPressed;
  final bool toApplyPressed;
  final bool appliedPressed;
  final bool rejectedPressed;
  final bool acceptedPressed;
  final Function onPressedToApply;
  final Function onPressedApplied;
  final Function onPressedRejected;
  final Function onPressedAccepted;

  Tile(
      {@required this.title,
      this.link,
      this.onPressed,
      this.acceptedPressed,
      this.appliedPressed,
      this.rejectedPressed,
      this.toApplyPressed,
      this.onPressedAccepted,
      this.onPressedApplied,
      this.onPressedRejected,
      this.onPressedToApply});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        color: Color(0xffeeeeee),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(widget.title),
              ),
              MaterialButton(
                hoverColor: Color(0xffeeeeee),
                onPressed: () {},
                child: RichText(
                  text: TextSpan(
                      text: widget.link,
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(widget.link);
                        }),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Tooltip(
                        message: 'To apply',
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: MaterialButton(
                            minWidth: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            onPressed: widget.onPressedToApply,
                            color: widget.toApplyPressed
                                ? Colors.greenAccent
                                : null,
                            child: Icon(
                              Icons.call_made,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: 'Applied',
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: MaterialButton(
                            minWidth: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            onPressed: widget.onPressedApplied,
                            color: widget.appliedPressed
                                ? Colors.greenAccent
                                : null,
                            child: Icon(
                              Icons.done,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: 'Rejected',
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: MaterialButton(
                            minWidth: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            onPressed: widget.onPressedRejected,
                            color: widget.rejectedPressed
                                ? Colors.redAccent
                                : null,
                            child: Icon(
                              Icons.clear,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Tooltip(
                        message: 'Accepted',
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: MaterialButton(
                            minWidth: 40,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            onPressed: widget.onPressedAccepted,
                            color: widget.acceptedPressed ? Colors.green : null,
                            child: Icon(
                              Icons.beenhere_outlined,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    onPressed: widget.onPressed,
                    child: Icon(Icons.delete),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
