// To parse this JSON data, do
//
//     final standardUserModel = standardUserModelFromJson(jsonString);

import 'dart:convert';

StandardUserModel standardUserModelFromJson(String str) =>
    StandardUserModel.fromJson(json.decode(str));

String standardUserModelToJson(StandardUserModel data) =>
    json.encode(data.toJson());

class StandardUserModel {
  StandardUserModel({
    this.username,
    this.email,
  });

  String? username;
  String? email;

  factory StandardUserModel.fromJson(Map<String, dynamic> json) =>
      StandardUserModel(
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
      };
}
