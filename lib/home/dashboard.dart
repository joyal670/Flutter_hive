import 'package:flutter/material.dart';
import 'package:sample/home/account.dart';
import 'package:sample/home/search.dart';
import 'package:sample/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'home.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  final _pages = [HomeScreen(), SearchScreen(), AccountScreen()];

  @override
  Widget build(BuildContext context) {
    //ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                // signOut(context);
                showBottomSheet(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
        ),
      ),
    );
  }

  signOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return SplashScreen();
    }), (route) => false);
  }

  showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 500,
            color: Colors.blue,
            child: ListView(
              children: [
                Text("Title"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'))
              ],
            ),
          );
        });
  }
}
