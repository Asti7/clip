import 'package:clip/pages/main_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tile extends StatefulWidget {
  final String title;
  final String link;
  final Function onPressed;

  Tile({@required this.title, this.link, this.onPressed});
  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  List<bool> isSelected = [false, false, false, false];

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
                  Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(20)),
                    ),
                    color: Color(0xffeeeeee),
                    child: ToggleButtons(
                      children: [
                        Tooltip(
                          message: 'To Apply ',
                          child: Icon(Icons.call_made),
                        ),
                        Tooltip(message: 'Applied', child: Icon(Icons.check)),
                        Tooltip(message: 'Rejected', child: Icon(Icons.clear)),
                        Tooltip(
                          message: 'Accepted',
                          child: Icon(Icons.beenhere),
                        ),
                      ],
                      isSelected: isSelected,
                      onPressed: (int index) {
                        setState(() {
                          isSelected[index] = !isSelected[index];
                        });
                      },
                      color: Colors.black,
                      selectedColor: Colors.green,
                      fillColor: Color(0xff393b44),
                      renderBorder: false,
                    ),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  MaterialButton(
                    minWidth: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    onPressed: widget.onPressed,
                    color: Colors.red,
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
