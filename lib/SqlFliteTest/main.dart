import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/SqlFliteTest/Database/quiz_database.dart';
import 'package:quizapp/SqlFliteTest/Provider/quiz_provider.dart';
import 'package:quizapp/SqlFliteTest/Screens/UserLogin/loginpage.dart';
import 'package:quizapp/SqlFliteTest/Screens/admin/adminpage.dart';
import 'package:quizapp/SqlFliteTest/Screens/create_quiz.dart';
import 'package:quizapp/SqlFliteTest/Screens/result_screen.dart';
import 'package:quizapp/SqlFliteTest/Screens/splash.dart';

import 'Screens/home_page.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await QuizDatabase.quizDatabase.initDatabase();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDUo7tCfuw5NAIcoQjSk9B3-jKf_POaB8s",
          appId: "1:595430008708:android:1aabf10a12f8e930bedfd1",
          messagingSenderId: "",
          projectId:"quizapp-24c57",
      storageBucket: "quizapp-24c57.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizProvider>(
            create: (context) => QuizProvider()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(393, 857),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
                routes: {'/resultScreen': (context) => ResultScreen()},
                navigatorKey: AppRouter.navKey,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  primarySwatch: Colors.teal,
                ),
                home:
                //AdminPage()
                //Qsplash()
                 HomePage(),
                );
          }),
    );
  }
}
