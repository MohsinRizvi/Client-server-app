import 'package:flutter/material.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[900],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "IDEA ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "DESCRIPTION",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 190,
              decoration: BoxDecoration(
                  //color: Colors.black, borderRadius: BorderRadius.circular(6),
                  ),
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                  child: Image(
                alignment: Alignment.center,
                image: AssetImage('lib/Assets/good.JPG'),
              )),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 8,
                  ),
                  Text("Investee Name"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Idea Title"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Description"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
