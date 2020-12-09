import 'package:dashboard_flutter_01/blog/views/homepage.dart';
import 'package:dashboard_flutter_01/dashsetting/src/pages/settings/settings1.dart';
import 'package:dashboard_flutter_01/investee/InvesteeHome.dart';
import 'package:dashboard_flutter_01/investor/InvestorHome.dart';
import 'package:dashboard_flutter_01/discussionground/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => HomeScreen(),
        '/InvesteeHome': (BuildContext context) => InvesteeHome(),
        '/InvestorHome': (BuildContext context) => InvestorHome(),
        '/HomePage': (BuildContext context) => HomePage(),
        '/dashsetting': (BuildContext context) => SettingsOnePage()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF006064),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(110.0, 0.0, 0.0, 0.0),
                        child: Align(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('assets/images/fyp logo.jpg'),
                            height: 150,
                            width: 140,
                          ),
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "DASHBOARD",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridDashboards(),
        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class GridDashboards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InvestorHome()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/inv.png"),
                      onPressed: () {},
                    ),
                    Text(
                      "INVESTOR",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "A person who invest",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InvesteeHome()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/investee.png"),
                      onPressed: () {},
                    ),
                    Text(
                      "INVESTEE",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Proposed ideas",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/blogs.png"),
                      onPressed: () {},
                    ),
                    Text(
                      "BLOGS",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Write from heart",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/chat.jpg"),
                      onPressed: () {},
                    ),
                    Text(
                      "DISCUSSION GROUND",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Gives feedback",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                //Navigator.of(context).pushNamed('/login');
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/lawyer.png"),
                      onPressed: () {},
                    ),
                    Text(
                      "LAWYER",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Deal Legal matters",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsOnePage()));
              },
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      alignment: Alignment.topCenter,
                      iconSize: 70.0,
                      icon: Image.asset("assets/images/setting.jpg"),
                      onPressed: () {},
                    ),
                    Text(
                      "SETTINGS",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "To change general",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.cyan[900],
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
