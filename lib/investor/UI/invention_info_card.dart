import 'package:flutter/material.dart';
import 'package:dashboard_flutter_01/investor/Models/global.dart';
import 'package:dashboard_flutter_01/investor/Models/invention.dart';
import 'package:dashboard_flutter_01/investor/Models/user.dart';

import '../description.dart';

class InventionInfoCard extends StatelessWidget {
  final Invention invention;

  const InventionInfoCard({Key key, this.invention}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //height: 100,
                child: Text("Investee Details", style: smallTitle),
              ),

              Container(
                height: 250,
                child: Text("Idea is about the new laptop scheme.... "
                    "......."
                    "................."
                    "to read the complete details kindly unlock!!", style: DefaultTextStyle.of(context).style.apply(fontSizeDelta: 4)),
              ),




              Container(
                  child: Row(children: <Widget>[
                    Container(
                      width: 50,
                      height: 40,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5)
                        ],
                      ),
                      child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 5, left: 5),
                              child: Icon(Icons.favorite_border,
                                  color: Colors.cyan[900], size: 40),),
                            FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  //side: BorderSide(color: Colors.red)
                                ),
                                child: Container(),
                                onPressed: () {}),
                          ]
                      ),),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan[900],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5)
                          ],
                        ),
                        height: 50,
                        width: 225,
                        child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              //side: BorderSide(color: Colors.red)
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: <Widget>[
                                  Text("Unlock", style: whiteTitle),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.white)
                                ]),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => CreateBlog()
                              ));
                            }))
                  ]))
            ],
          ),
          height: 380,
          width: 330);
    }




    Widget userCard(User user) {
      return Container(
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5), blurRadius: 5)
                ],
              ),
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(8.0),
                child: Image(image: user.profilePic, fit: BoxFit.cover),),),
            Text(user.firstName + " " + user.lastName, style: namesSmall)
          ],)
      );
    }
  }

