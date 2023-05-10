import 'package:flutter/material.dart';
import 'package:sample/navigation/screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getSavedData(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
            ),
            ElevatedButton(
              onPressed: () {
                saveData();
              },
              child: Text("Save data"),
            )
          ],
        ),
      ),
    );
  }

  saveData() async {
    print(_textController.text);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("key", _textController.text);
  }

  getSavedData(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final savedValue = preferences.getString("key");
    if (savedValue != null && savedValue.isNotEmpty) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ScreenTwo()));
    }
  }
}
