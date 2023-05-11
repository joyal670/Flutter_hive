import 'package:hive_flutter/hive_flutter.dart';

class UserModel {
  int? id;

  final String userName;

  final String password;

  UserModel({this.id, required this.userName, required this.password});

  static UserModel getUserModel(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['user'] as String;
    final pass = map['pass'] as String;
    return UserModel(id: id, userName: name, password: pass);
  }
}
