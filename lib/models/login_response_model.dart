// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginResponseModel welcomeFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String welcomeToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.status,
    this.code,
    this.data,
  });

  int? status;
  int? code;
  LoginResponse? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        code: json["code"],
        data: LoginResponse.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data?.toJson(),
      };
}

class LoginResponse {
  LoginResponse({
    this.user,
  });

  User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.status,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? status;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "status": status,
        "token": token,
      };
}
