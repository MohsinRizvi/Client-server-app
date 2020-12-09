import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard_flutter_01/blog/views/create_blog.dart';
import 'package:dashboard_flutter_01/blog/helper/crud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_flutter_01/blog/helper/data.dart';
import 'package:dashboard_flutter_01/blog/models/categorie_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  List<CategorieModel> categories = List<CategorieModel>();

  Widget blogsList() {
    return Container(
      child: blogsStream != null
          ? Stack(
              children: [
                StreamBuilder(
                  stream: blogsStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return blogsTile(
                            authorName: snapshot.data.documents[index]
                                    .data()['authorName'] ??
                                'default',
                            title: snapshot.data.docs[index].data()["title"] ??
                                'default',
                            description:
                                snapshot.data.docs[index].data()['desc'] ??
                                    'default',
                            imgUrl: snapshot.data.docs[index].data()['imgUrl'],
                          );
                        });
                  },
                ),
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    crudMethods.getData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

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
                "Blogging",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Ground",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.account_box, color: Colors.white),
            )
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Center(
            child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 14),
                        height: 100,
                        child: ListView.builder(
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieNames,
                              );
                            }),
                      ),
                      Flexible(
                        child: ListView(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            children: <Widget>[
                              blogsList(),
                              // child: blogsList(),
                            ]),
                      ),
                    ])))); //blogsList(),
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateBlog()));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl,
                  height: 60, width: 120, fit: BoxFit.cover),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
// ignore: camel_case_types, must_be_immutable
class blogsTile extends StatelessWidget {
  String imgUrl, title, description, authorName;
  blogsTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.description,
      @required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 150,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: imgUrl != null
                ? CachedNetworkImage(
                    imageUrl: imgUrl,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  )
                : Container(),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  authorName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
