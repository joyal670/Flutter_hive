import 'package:flutter/material.dart';
import 'package:sample/home/dashboard.dart';
import 'package:sample/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';

const IS_USER_LOGINED = 'isUserLogined';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isUserLogined();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/unnamed.jpg',
          height: 200,
          width: 200,
        ),
      ),
    );
  }

  Future<void> navigateToLoginPage() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }));
    });
  }

  isUserLogined() async {
    final preference = await SharedPreferences.getInstance();
    final userLogined = preference.getBool(IS_USER_LOGINED);
    if (userLogined == null || userLogined == false) {
      navigateToLoginPage();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return DashBoardScreen();
      }));
    }
  }
}
