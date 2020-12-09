import 'package:flutter/material.dart';
import 'package:dashboard_flutter_01/investee/Models/global.dart';
import 'package:dashboard_flutter_01/investee/Models/invention.dart';
import 'package:dashboard_flutter_01/investee/Models/user.dart';
import 'invention_page.dart';

class InventCard extends StatelessWidget {
  final Invention invention;
  final User inventor;
  const InventCard({Key key, this.invention, this.inventor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          margin: EdgeInsets.only(left: 15),
          constraints: BoxConstraints(maxHeight: 290),
          width: 180,
          decoration: BoxDecoration(
              color: Colors.cyan[900],
              borderRadius: BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
              ],
              gradient: RadialGradient(
                center: const Alignment(1.5, -0.9), // near the top right
                radius: 1.3,
                colors: [
                  const Color(0xFF006064), // yellow sun
                  const Color(0xFF006064), // blue sky
                ],
                stops: [0.1, 1.0],
              )),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(25.0),
              //side: BorderSide(color: Colors.red)
            ),
            child: Container(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InventionPage(invention: invention)),
              );
            },
          )),
      Container(
        padding: EdgeInsets.only(top: 20),
        width: 200,
        child: Column(children: <Widget>[
          Container(
            child: Image(
              image: invention.images,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(invention.name, style: whiteTitle),
                  Text(inventor.firstName + " " + inventor.lastName,
                      style: whiteTitle)
                ],
              ))
        ]),
      )
    ]);
  }
}
