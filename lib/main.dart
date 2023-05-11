import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:sample/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/listing.dart';

late SharedPreferences preferences;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  openDataB();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Center(
          child: Material(
            color: Colors.amberAccent,
            child: InkWell(
              child: Container(width: 200, height: 200, child: Text("skdh")),
              onTap: () {
                MotionToast(
                        description: Text("ontap"),
                        primaryColor: Colors.black12)
                    .show(context);
              },
              onLongPress: () {
                MotionToast(
                        description: Text("onLongPress"),
                        primaryColor: Colors.black12)
                    .show(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
