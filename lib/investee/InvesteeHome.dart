import 'package:dashboard_flutter_01/investee/sidebar_Investee/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_flutter_01/investee/Models/global.dart';
import 'package:dashboard_flutter_01/investee/UI/invent_card.dart';
import 'Models/invention.dart';
import 'Models/user.dart';
import 'UI/category_card.dart';
import 'description.dart';

void main() => runApp(RedTape());

class RedTape extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'investee',
      theme: ThemeData(
        primarySwatch: Colors.cyan[900],
      ),
      routes: <String, WidgetBuilder>{
        '/SideBar': (BuildContext context) => SideBar()
      },
      home: InvesteeHome(),
    );
  }
}

class InvesteeHome extends StatefulWidget {
  @override
  _InvesteeHomeState createState() => _InvesteeHomeState();
}

class _InvesteeHomeState extends State<InvesteeHome> {
  Color inactive = Colors.black.withOpacity(0.3);
  Map activeTab = {
    0: Colors.black,
    1: Colors.black.withOpacity(0.3),
    2: Colors.black.withOpacity(0.3)
  };
  int active;
  @override
  initState() {
    active = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.cyan[900],
          title: Text(
            'Investee Home',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: SideBar(),
        ),
        body: Center(
            child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(20),
                          child: Row(children: <Widget>[
                            FlatButton(
                                child: Text("List Of Ideas",
                                    style: blackButtonTitle
                                    // style: TextStyle(
                                    //     color: activeTab[0],
                                    //     fontFamily: "Helvetica",
                                    //     fontWeight: FontWeight.bold,
                                    //     fontSize: 17
                                    //   )
                                    ),
                                onPressed: () {
                                  // Navigator.push(
                                  // context,
                                  // MaterialPageRoute(
                                  //     builder: (context) => CreateIdea()));

                                  if (active != 0) {
                                    setState(() {
                                      activeTab[active] = inactive;
                                      active = 0;
                                      activeTab[active] = Colors.black;
                                    });
                                  }
                                }),
                          ])),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          child: ListView(
                              padding: EdgeInsets.only(
                                  left: 30, top: 10, bottom: 10),
                              children: getInventions(),
                              scrollDirection: Axis.horizontal)),
                      InkWell(
                        child: Container(
                            child: Column(children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              margin: EdgeInsets.only(top: 30, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // Text("Explore categories",
                                  //     style: blackButtonTitle),
                                  Text("Add Idea", style: blackButtonTitle),
                                ],
                              )),
                          Container(
                              height: 105,
                              child: ListView(
                                padding: EdgeInsets.only(left: 30),
                                scrollDirection: Axis.horizontal,
                                children: getCategories(),
                              ))
                        ])),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateIdea()));
                        },
                      ),
                    ]))));
  }

  List<String> categoryNames = [
    "Tech",
    "Gadgets",
    "Accessories",
    "Health",
    "Medicine"
  ];
  Map categoryIcons = {
    "Tech": Icon(Icons.phonelink, color: Colors.white, size: 50),
    "Gadgets": Icon(Icons.wb_incandescent, color: Colors.white, size: 50),
    "Accessories": Icon(Icons.brush, color: Colors.white, size: 50),
    "Health": Icon(Icons.directions_run, color: Colors.white, size: 50),
    "Medicine": Icon(Icons.healing, color: Colors.white, size: 50),
  };

  List<Widget> getCategories() {
    List<Widget> categories = [];
    for (String category in categoryNames) {
      categories.add(CategoryCard(
          categoryName: category, categoryIcon: categoryIcons[category]));
    }
    return categories;
  }

  List<Widget> getInventions() {
    List<Widget> inventions = [];
    User kalle =
        new User("Kalle", "Hallden", [], AssetImage('lib/Assets/good.JPG'));
    for (int i = 0; i < 10; i++) {
      Invention invent = new Invention("Auto Computer", [kalle], [kalle], 0.65,
          "Tech", AssetImage('lib/Assets/laptop.png'));
      kalle.inventions.add(invent);
      inventions.add(InventCard(invention: invent, inventor: kalle));
    }
    return inventions;
  }
}
