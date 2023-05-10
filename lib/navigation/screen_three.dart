import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  final String name;

  const ScreenThree({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Screen Three"),
            ElevatedButton(
              onPressed: () {},
              child: Text("name is $name"),
            )
          ],
        ),
      ),
    );
  }
}
