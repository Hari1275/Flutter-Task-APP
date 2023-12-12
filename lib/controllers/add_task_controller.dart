import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/models/user.dart';

import '../constants/firebase.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  TextEditingController title = TextEditingController();
  TextEditingController amount = TextEditingController();
  // Rx<UserModel> userModel = UserModel(title: '', amount: '').obs;
  RxList<UserModel> userModel = <UserModel>[].obs;
  // final userModel = <Vehicle>[].obs;
  String collection = "users";
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  onReady() {
    super.onReady();
    userModel.bindStream(getAllUserTask());

    print(userModel);
  }

  Future<void> addUser() {
    return users.add({
      'title': title.text.toString(),
      'amount': amount.text.toString()
    }).whenComplete(() {
      _clearControllers();
      Get.back();

      Get.snackbar(
        "SUCCUSS",
        'your task was added...',
      );
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> deleteUser(String id) {
    return users.doc(id).delete().then((value) {
      Get.back();
      Get.snackbar("SUCCUSS", 'your task deleted...',
          backgroundColor: Colors.green, colorText: Colors.white);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> EditUser(String id) {
    return users.doc(id).update({
      'title': title.text.toString(),
      'amount': amount.text.toString()
    }).whenComplete(() {
      _clearControllers();
      Get.back();
      Get.snackbar(
        "SUCCUSS",
        'your task  editted...',
      );
    }).catchError((error) => print("Failed to add user: $error"));
  }

  _clearControllers() {
    title.clear();
    amount.clear();
  }

  Stream<List<UserModel>> getAllUserTask() => firebaseFirestore
      .collection(collection)
      .orderBy('title', descending: true)
      .snapshots()
      .map((query) =>
          query.docs.map((item) => UserModel.fromMap(item)).toList());
}
