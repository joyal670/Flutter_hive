import 'package:flutter/material.dart';
import 'package:sample/navigation/screen_three.dart';

class ScreenTwo extends StatelessWidget {
  ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("List Tile $index"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ScreenThree(
                  name: 'welcome $index',
                );
              }));
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 10,
      )),
    );
  }
}
