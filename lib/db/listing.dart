import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/usermodel.dart';

ValueNotifier<List<UserModel>> userModelListener = ValueNotifier([]);

void addUser(UserModel model) async {
  final studentTable = await Hive.openBox<UserModel>('student_db');
  //final _id = await studentTable.add(model);
  model.id = await studentTable.add(model);
  userModelListener.value.add(model);
  userModelListener.notifyListeners();
}

void getAllUsers() async {
  final studentTable = await Hive.openBox<UserModel>('student_db');
  userModelListener.value.clear();
  userModelListener.value.addAll(studentTable.values);
  userModelListener.notifyListeners();
}

deleteUser(int id) async {
  final studentTable = await Hive.openBox<UserModel>('student_db');
  studentTable.delete(id);
  getAllUsers();
}
