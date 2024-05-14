import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Screens/loginpage.dart';

import '../Database/firebasehelper.dart';

class signup extends StatefulWidget {
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  Color mainColor = Colors.blue;
  var formkey = GlobalKey<FormState>();
  bool showpass = true;
  bool showconpass=true;
  var semail=TextEditingController();
  var spass=TextEditingController();
  var sconpass=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          color: mainColor,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              height: 550,
              width: 450,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: Text(
                    "REGISTRATION",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      controller: semail,
                      validator: (email) {
                        if (email!.isEmpty ||
                            !email.contains(".") ||
                            !email.contains("@")) {
                          return "Please enter valid email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: mainColor),
                          hintText: "E-mail",
                          hintStyle: TextStyle(color: mainColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: TextFormField(
                      controller: spass,
                      validator: (password) {
                        if (password!.isEmpty || password.length < 6) {
                          return "Please enter valid passord";
                        } else {
                          return null;
                        }
                      },
                      obscureText: showpass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: "Password",
                          labelStyle: TextStyle(color: mainColor),
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showpass == true) {
                                  showpass = false;
                                } else {
                                  showpass = true;
                                }
                              });
                            },
                            icon: Icon(showpass == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintStyle: TextStyle(color: mainColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: TextFormField(
                      validator: (conpass) {
                        if(conpass==spass.text){
                          if (conpass!.isEmpty || conpass.length < 6) {
                            return "Please enter valid password";
                          } else {
                            return null;
                          }
                        }else{
                            return "Password not match";

                        }
                      },
                      controller: sconpass,
                      obscureText: showconpass,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: mainColor),
                          hintText: "Confirm Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showconpass == true) {
                                  showconpass = false;
                                } else {
                                  showconpass = true;
                                }
                              });
                            },
                            icon: Icon(showconpass == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintStyle: TextStyle(color: mainColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: mainColor,
                            elevation: 6.0,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              firebaseHelper()
                                  .SignUp(mail: semail.text!, password: spass.text!)
                                  .then((value) {
                                if (value == null) {
                                  Get.to(loginpage());
                                } else {
                                  Get.snackbar("Error", value);
                                }
                              });
                            } else {}
                          },
                          child: Text("SIGNUP"))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            Get.off(loginpage());
                          },
                          child: Text("Already have an account? Log up"))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
