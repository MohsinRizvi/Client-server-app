import 'dart:async';
import 'package:dashboard_flutter_01/Profile/investee_profile/profilesupdate.dart';
import 'package:dashboard_flutter_01/dashboard/dash.dart';
import 'package:dashboard_flutter_01/dashsetting/src/pages/settings/settings1.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    // isSidebarOpenedStreamController = PublishSubject<bool>();
    // isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    // isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   isSidebarOpenedStreamController.close();
  //   isSidebarOpenedSink.close();
  //   super.dispose();
  // }

  // void onIconPressed() {
  //   final animationStatus = _animationController.status;
  //   final isAnimationCompleted = animationStatus == AnimationStatus.completed;
  //
  //   if (isAnimationCompleted) {
  //     isSidebarOpenedSink.add(false);
  //     _animationController.reverse();
  //   } else {
  //     isSidebarOpenedSink.add(true);
  //     _animationController.forward();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  color: const Color(0xFF006064),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment(1.4, -0.9),
                            child: GestureDetector(
                              onTap: () {
                                // onIconPressed();
                              },
                              child: ClipPath(
                                clipper: CustomMenuClipper(),
                                child: Container(
                                  width: 35,
                                  height: 100,
                                  color: Color(0xFF006064),
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedIcon(
                                    progress: _animationController.view,
                                    icon: AnimatedIcons.menu_close,
                                    color: Color(0xFFE1F5FE),
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          ListTile(
                            title: Text(
                              "InvestmentEra",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            ),
                            subtitle: Text(
                              "InvestmentEra.com",
                              style: TextStyle(
                                color: Color(0xFFE1F5FE),
                                fontSize: 15,
                              ),
                            ),
                            leading: CircleAvatar(
                              child: Icon(
                                Icons.perm_identity,
                                color: Colors.white,
                              ),
                              radius: 40,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 30,
                        endIndent: 32,
                      ),
                      MenuItem(
                          icon: Icons.person,
                          title: "Profile",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Investee_profile()));
                          }),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        },
                      ),
                      Divider(
                        height: 20,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingsOnePage()));
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
