import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.id,
    this.title,
    this.amount,
  });

  String? id;
  String? title;
  String? amount;

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       id: json["id"],
  //       title: json["title"],
  //       amount: json["amount"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "amount": amount,
  //     }
  //
  // ;
  UserModel.fromMap(DocumentSnapshot data) {
    id = data.id;
    title = data["title"];
    amount = data["amount"];
  }
}
