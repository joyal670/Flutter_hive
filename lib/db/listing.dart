import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/usermodel.dart';

ValueNotifier<List<UserModel>> userModelListener = ValueNotifier([]);

late Database _database;

void addUser(UserModel model) async {
  await _database.rawInsert("INSERT INTO user (user, pass) VALUES (?, ?)",
      [model.userName, model.password]);

  getAllUsers();
  userModelListener.value.add(model);
  userModelListener.notifyListeners();
}

void getAllUsers() async {
  final _values = await _database.rawQuery('SELECT * FROM user');
  print(_values);

  userModelListener.value.clear();

  _values.forEach((element) {
    final user = UserModel.getUserModel(element);
    userModelListener.value.add(user);
    userModelListener.notifyListeners();
  });
}

deleteUser(int id) async {
  print(id);
  _database.rawDelete('DELETE FROM user WHERE id = (?)', [id]);
  getAllUsers();
}

openDataB() async {
  _database = await openDatabase(
    'student_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE user (id INTEGER PRIMARY KEY, user TEXT, pass TEXT)');
    },
  );
}
