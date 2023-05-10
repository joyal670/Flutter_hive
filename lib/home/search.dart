import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../db/listing.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    getAllUsers();
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: userModelListener,
        builder: (context, value, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data = value[index];
                return ListTile(
                  title: Text(data.userName),
                  subtitle: Text(data.password),
                  onTap: () {
                    _displaySuccessMotionToast(data.userName);
                  },
                  trailing: IconButton(
                    onPressed: () {
                      if (data.id != null) {
                        deleteUser(data.id!);
                      } else {
                        _displaySuccessMotionToast("unable to delete");
                      }
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: value.length);
        },
      ),
    );
  }

  void _displaySuccessMotionToast(String userName) {
    MotionToast toast = MotionToast.success(
      title: Text(
        userName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'eiusmod tempor',
        style: TextStyle(fontSize: 12),
      ),
      dismissable: true,
    );
    toast.show(context);
    Future.delayed(const Duration(seconds: 4)).then((value) {
      toast.dismiss();
    });
  }
}
