import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/Screens/homepage.dart';
import 'package:quizapp/Screens/signuppage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDUo7tCfuw5NAIcoQjSk9B3-jKf_POaB8s",
          appId: "1:595430008708:android:1aabf10a12f8e930bedfd1",
          projectId: "quizapp-24c57",
          messagingSenderId: ''));
  User? user = FirebaseAuth.instance.currentUser;
  runApp(GetMaterialApp(
    home: user == null ? loginpage() : homepage(),
  ));
}

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  Color mainColor = Colors.blue;
  bool showpass=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            height: 500,
            width: 450,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                    child: Text(
                      "QuizApp",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: TextFormField(
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
                  child: TextFormField(obscureText: showpass,obscuringCharacter: "*",
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                        labelText: "Password",
                        labelStyle: TextStyle(color: mainColor),
                        hintText: "Password",
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            if(showpass==true){
                              showpass=false;
                            }else{
                              showpass=true;
                            }
                          });
                        }, icon: Icon(showpass==true?Icons.visibility_off:Icons.visibility),),
                        hintStyle: TextStyle(color: mainColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                SizedBox(height: 50,),
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
                        onPressed: () {},
                        child: Text("LOGIN"))),
                SizedBox(height: 10,),
                Center(child: TextButton(onPressed: () {
                  Get.off(signup());
                }, child: Text("Don't have an account? Sign up"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
