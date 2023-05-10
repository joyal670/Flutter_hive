import 'package:flutter/material.dart';
import 'package:sample/db/listing.dart';
import 'package:sample/model/usermodel.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter user name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _userPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    addUserData();
                  },
                  child: const Text('Save details'))
            ],
          ),
        ),
      ),
    );
  }

  void addUserData() {
    final userName = _userNameController.text;
    final password = _userPasswordController.text;
    if (userName.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please fill all field"),
        margin: EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ));
      return;
    } else {
      _userNameController.text = "";
      _userPasswordController.text = "";
      final user = UserModel(userName: userName, password: password);
      addUser(user);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Data saved"),
        margin: EdgeInsets.all(8),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ));
    }
  }
}
