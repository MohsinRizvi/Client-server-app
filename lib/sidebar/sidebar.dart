import 'dart:async';
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
    // final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return Stack(
          children: [
            Row(
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
                                  //onIconPressed();
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
                                "www.investmentera.com",
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
                          icon: Icons.home,
                          title: "About",
                          onTap: () {
                            //onIconPressed();
                            // BlocProvider.of<NavigationBloc>(context)
                            //     .add(NavigationEvents.HomePageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.person,
                          title: "Version",
                          onTap: () {
                            // onIconPressed();
                            // BlocProvider.of<NavigationBloc>(context)
                            //     .add(NavigationEvents.MyAccountClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.shopping_basket,
                          title: "Report Problem",
                          onTap: () {
                            //onIconPressed();
                            // BlocProvider.of<NavigationBloc>(context)
                            //     .add(NavigationEvents.IEPageClickedEvent);
                          },
                        ),
                        MenuItem(
                          icon: Icons.card_giftcard,
                          title: "Privacy Policy",
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
                          title: "Helps and Faq",
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
          ],
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
