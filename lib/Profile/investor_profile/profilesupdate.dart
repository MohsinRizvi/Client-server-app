import 'package:flutter/material.dart';

void main() {
  runApp(InvestorProfileform());
}

class InvestorProfileform extends StatefulWidget {
  @override
  _InvestorProfileformState createState() => _InvestorProfileformState();
}

class _InvestorProfileformState extends State<InvestorProfileform> {
  final _formKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> listDrop = [];

  void localdata() {
    listDrop.add(
      new DropdownMenuItem(child: new Text('Item no. 1'), value: 'val-1'),
    );
  }

  TextEditingController _email = TextEditingController();
  TextEditingController _Experience = TextEditingController();
  TextEditingController _Fullname = TextEditingController();
  TextEditingController _AreaOfInvestment = TextEditingController();
  TextEditingController _PhoneNo = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _DOB = TextEditingController();
  TextEditingController _NIC = TextEditingController();
  TextEditingController _PNo = TextEditingController();
  TextEditingController _City = TextEditingController();
  TextEditingController _State = TextEditingController();
  TextEditingController _PCode = TextEditingController();
  TextEditingController _Range = TextEditingController();
  String gender;
  String groupValue = "male";

  var firstColor = Color(0xff5b86e5), secondColor = Color(0xff36d1dc);

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  bool passwordVisible;

  // ignore: must_call_super
  void initState() {
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.cyan[900],
                        child: ClipOval(
                          child: SizedBox(
                            width: 180.0,
                            height: 180.0,
                            //     child: Image.network("src",fit: BoxFit.fill,),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 30.0,
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _Range,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: "eg:20k-50k",
                              hintText: "Range of ideas",
                              icon: Icon(Icons.view_column),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The range field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///
                ///
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _Fullname,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Full name',
                              hintText: "Full name",
                              icon: Icon(Icons.person_outline),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The name field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: new Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: ListTile(
                          title: Text(
                            "male",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Radio(
                              value: "male",
                              groupValue: groupValue,
                              onChanged: (e) => valueChanged(e)),
                        )),
                        Expanded(
                            child: ListTile(
                          title: Text(
                            "female",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Radio(
                              value: "female",
                              groupValue: groupValue,
                              onChanged: (e) => valueChanged(e)),
                        )),
                      ],
                    ),
                  ),
                ),

                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _email,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Email',
                              hintText: "Email",
                              icon: Icon(Icons.alternate_email),
                              border: InputBorder.none),
                          // ignore: missing_return
                          validator: (value) {
                            if (value.isEmpty) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please make sure your email address is valid';
                              else
                                return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _AreaOfInvestment,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Areas of Investment',
                              hintText: "Areas of Investment",
                              icon: Icon(Icons.add_business_sharp),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Area of investment cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///
                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _Experience,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: "eg:5 - 10 years",
                              hintText: "Experience",
                              icon: Icon(Icons.view_column),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The experience field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///
                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _PhoneNo,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Phone Number',
                              hintText: "Phone Number",
                              icon: Icon(Icons.phone),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Phone Number field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _Address,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Address',
                              hintText: "Address",
                              icon: Icon(Icons.home),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Address field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _DOB,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Date Of Birth',
                              hintText: "DOB",
                              icon: Icon(Icons.date_range),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Date Of Birth field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _NIC,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'NIC Number',
                              hintText: "NIC Number",
                              icon: Icon(Icons.credit_card),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Date Of Birth field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                ///

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _PNo,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Passport Number',
                              hintText: "Passport Number",
                              icon: Icon(Icons.credit_card),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Date Of Birth field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _City,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'City',
                              hintText: "City",
                              icon: Icon(Icons.location_city),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The City Of Birth field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _State,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'State',
                              hintText: 'State',
                              icon: Icon(Icons.my_location),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The State Of Birth field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _PCode,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.0),
                                    width: 2.0),
                              ),
                              labelText: 'Postal Code / Zip Code',
                              hintText: "Postal Code / Zip Code",
                              icon: Icon(Icons.add_location),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The Postal Code / Zip Code field cannot be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                //   child: Material(
                //     borderRadius: BorderRadius.circular(10.0),
                //     color: Colors.grey.withOpacity(0.2),
                //     elevation: 0.0,
                //     child: Padding(
                //         padding: const EdgeInsets.only(left: 12.0),
                //         child: DropdownButton(items: null, onChanged: null)),
                //   ),
                // ),

                // Visibility(
                //   visible: true,
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                //     child: Material(
                //       borderRadius: BorderRadius.circular(10.0),
                //       color: Colors.grey.withOpacity(0.2),
                //       elevation: 0.0,
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 12.0),
                //         child: ListTile(
                //           title: TextFormField(
                //             enabled: false,
                //             keyboardType: TextInputType.text,
                //             controller: _password,
                //             obscureText: passwordVisible,
                //             decoration: InputDecoration(
                //                 focusedBorder: OutlineInputBorder(
                //                   borderSide: BorderSide(
                //                       color: Colors.grey.withOpacity(0.0),
                //                       width: 2.0),
                //                 ),
                //                 labelText: 'Password',
                //                 hintText: "Password",
                //                 icon: Icon(Icons.lock_outline),
                //                 border: InputBorder.none),
                //             validator: (value) {
                //               if (value.isEmpty) {
                //                 return "The password field cannot be empty";
                //               } else if (value.length < 6) {
                //                 return "the password has to be at least 6 characters long";
                //               }
                //               return null;
                //             },
                //           ),
                //           trailing: IconButton(
                //             icon: Icon(
                //               // Based on passwordVisible state choose the icon
                //               passwordVisible
                //                   ? Icons.visibility_off
                //                   : Icons.visibility,
                //               color: Theme.of(context).primaryColorDark,
                //             ),
                //             onPressed: () {
                //               // Update the state i.e. toogle the state of passwordVisible variable
                //               setState(() {
                //                 passwordVisible = !passwordVisible;
                //               });
                //             },
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(15),
                  child: const Text('Submit', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //Navigator.push(context, MaterialPageRoute(builder:(BuildContext)=>Application()));
                      },
                      child: Text("Back",
                          style: TextStyle(
                              color: Color(0xFF5d74e3),
                              fontFamily: "Poppins-Bold",
                              fontSize: 20)),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
