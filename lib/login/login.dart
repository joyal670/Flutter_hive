import 'package:flutter/material.dart';
import 'package:sample/home/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home.dart';
import '../splash/splash.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isMatched = true;
  final _forKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _forKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(padding: EdgeInsets.all(15)),
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'User name'),
                  validator: (value) {
                    // if (_isMatched) {
                    //   return null;
                    // } else {
                    //   return "Error";
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                  validator: (value) {
                    // if (_isMatched) {
                    //   return null;
                    // } else {
                    //   return "Error";
                    // }
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isMatched,
                      child: const Text(
                        "Password not match",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // checkLoginValidation(context);
                        if (_forKey.currentState!.validate()) {
                          checkLoginValidation(context);
                        } else {}
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Login"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLoginValidation(BuildContext context) async {
    final _userName = _userNameController.text;
    final _password = _passwordController.text;

    if (_userName == _password) {
      final pref = await SharedPreferences.getInstance();
      pref.setBool(IS_USER_LOGINED, true);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return DashBoardScreen();
      }));
    } else {
      // snack bar
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Password not matched"),
        margin: EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));

      // show the dialog
      // showDialog(
      //     context: context,
      //     builder: (ctx) => AlertDialog(
      //           title: Text('Error'),
      //           content: Text('Password not matched'),
      //           actions: [
      //             TextButton(
      //                 onPressed: () {
      //                   Navigator.of(ctx).pop();
      //                 },
      //                 child: Text('close'))
      //           ],
      //         ));

      setState(() {
        _isMatched = false;
      });
    }
  }
}
