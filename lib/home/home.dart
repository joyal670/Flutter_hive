import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _list = ['apple', 'orange', 'pineapple'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // child: DropdownButtonFormField(
          //   hint: const Text('Select fruits'),
          //   onChanged: (value) {},
          //   items: _list.map((String items) {
          //     return DropdownMenuItem(
          //       value: items,
          //       child: Text(items),
          //     );
          //   }).toList(),
          // ),
          child: Material(
            color: Colors.red,
            child: InkWell(
              hoverColor: Colors.red,
              splashColor: Colors.green,
              focusColor: Colors.yellow,
              highlightColor: Colors.indigo,
              child: Container(
                width: 100,
                height: 200,
                alignment: Alignment.center,
                child: Text("inkwell"),
              ),
              onLongPress: () {
                MotionToast(
                        description: Text("asqwqw"),
                        primaryColor: Colors.black12)
                    .show(context);
              },
              onTap: () {
                MotionToast(
                        description: Text("sd"), primaryColor: Colors.black12)
                    .show(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
