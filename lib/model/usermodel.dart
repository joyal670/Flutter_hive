import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String password;

  UserModel({this.id, required this.userName, required this.password});
}
