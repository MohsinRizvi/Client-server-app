import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dashboard_flutter_01/login/signup.dart';
import 'package:dashboard_flutter_01/dashboard/dash.dart';
import 'package:dashboard_flutter_01/Paint/CustomPaintHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signUp': (BuildContext context) => SignupPage(),
        '/MyHomePage': (BuildContext context) => MyHomePage()
      },
      home: new MyHomePages(),
    );
  }
}

class MyHomePages extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePages> {
  final _formKey = GlobalKey<FormState>();
  String _error;
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                      Container(
                          padding: EdgeInsets.only(
                              top: 350.0, left: 20.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              showAlert(),
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
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey[200]))),
                                controller: _emailController,
                              ),
                              SizedBox(height: 5.0),
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
                                    labelText: 'PASSWORD',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[200]),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueGrey[200]))),
                                obscureText: true,
                                controller: _passwordController,
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                alignment: Alignment(1.0, 0.0),
                                padding: EdgeInsets.only(top: 10.0, left: 20.0),
                                child: InkWell(
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                        color: Colors.blueGrey[200],
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 7.0,
                                  child: InkWell(
                                    onTap: () {
                                      if (_formKey.currentState.validate()) {
                                        signIn();
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: Colors.cyan[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 40.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.white,
                                  color: Colors.white,
                                  elevation: 7.0,
                                  child: InkWell(
                                    //onTap: AuthProvider().loginWithGoogle(),

                                    child: Center(
                                      child: Text(
                                        'LOGIN WITH GMAIL',
                                        style: TextStyle(
                                            color: Colors.cyan[900],
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'New to Spotify ?',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.blueGrey),
                                  ),
                                  SizedBox(width: 5.0),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupPage()));
                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ))
                ]),
          )
        ]));
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

  signOut() {
    return FirebaseAuth.instance.signOut();
  }

  Future<void> signIn() async {
    try {
      await Firebase.initializeApp();
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('displayName', user.user.displayName);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    } on FirebaseAuthException
    // catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // }
    catch (e) {
      // print(e.toString());
      print(e);
      setState(() {
        _error = e.message;
      });
    }
  }
}

class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}
