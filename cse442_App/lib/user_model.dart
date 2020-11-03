// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.listOfJobs,
    this.location,
    this.phone,
    this.ratings,
    this.language,
    this.description,
    this.listOfRequest,
    this.id,
    this.updatedAt,
    this.createdAt,
    this.v,
    this.verify,
  });

  String firstname;
  String lastname;
  String email;
  String password;
  List<String> listOfJobs;
  String location;
  String phone;
  List<String> ratings;
  String language;
  String description;
  List<String> listOfRequest;
  String id;
  DateTime updatedAt;
  DateTime createdAt;
  int v;
  bool verify;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        listOfJobs: List<String>.from(json["listOfJobs"].map((x) => x)),
        location: json["location"],
        phone: json["phone"],
        ratings: List<String>.from(json["ratings"].map((x) => x)),
        language: json["language"],
        description: json["description"],
        listOfRequest: List<String>.from(json["listOfRequest"].map((x) => x)),
        id: json["_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        verify: json["verified"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "listOfJobs": List<dynamic>.from(listOfJobs.map((x) => x)),
        "location": location,
        "phone": phone,
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
        "language": language,
        "description": description,
        "listOfRequest": List<dynamic>.from(listOfRequest.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "verify": verify,
      };
}