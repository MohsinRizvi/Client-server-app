import 'package:auto_size_text/auto_size_text.dart';
import 'package:dashboard_flutter_01/Paint/CustomPaintHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dashboard_flutter_01/login/firebase.dart';

import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _error;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(children: <Widget>[
        TopBar_home(),
        Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              SizedBox(height: 10),
              showAlert(),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                        child: Align(
                          child: Image(
                            alignment: Alignment.center,
                            image: AssetImage('assets/images/fyp logo.jpg'),
                            height: 150,
                            width: 140,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 140.0, left: 17.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide an email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[200]),
                            hintText: 'EMAIL',
                            // hintStyle: ,
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey[200]))),
                        controller: _emailController,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Password can't be empty";
                          }
                          if (input.length < 6) {
                            return 'Longer password please';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'PASSWORD ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[200]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey[200]))),
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      // SizedBox(height: 0.0),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Provide a Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'NAME ',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[200]),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blueGrey[200]))),
                        controller: _usernameController,
                      ),
                      SizedBox(height: 15.0),
                      Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.white,
                            color: Colors.white,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () {
                                if (_formKey.currentState.validate()) {
                                  signup();
                                }
                              },

                              //signUp,
                              child: Center(
                                child: Text(
                                  'SIGNUP',
                                  style: TextStyle(
                                      color: Colors.cyan[900],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 15.0),
                      Container(
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blueGrey,
                                  style: BorderStyle.solid,
                                  width: 1.0),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePages()));
                            },
                            child: Center(
                              child: Text('Go Back',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      color: Colors.cyan[900])),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]))
      ]),
    );
  }

  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

  Future<void> signup() async {
    try {
      await Firebase.initializeApp();
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User updateUser = FirebaseAuth.instance.currentUser;
      updateUser.updateProfile(displayName: _usernameController.text);
      userSetup(_usernameController.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePages()));
    } on FirebaseAuthException
    //
    catch (e) {
      // print(e.toString());
      print(e);
      setState(() {
        _error = e.message;
      });
    }
  }
}
