import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/add_task_controller.dart';
import 'package:task_app/controllers/controllers.dart';
import 'package:task_app/models/user.dart';

class EditTask extends StatefulWidget {
  final id;
  final title;
  final amount;

  const EditTask({super.key, this.id, this.title, this.amount});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  // final UserController _usercontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    userController.title.text = widget.title;
    userController.amount.text = widget.amount;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(96, 255, 255, 255)),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Edit your task"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: userController.title,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Title')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: userController.amount,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount')),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shadowColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0)),
                                  ),
                                  onPressed: () {
                                    userController.EditUser(widget.id);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 8.0, 15.0, 8.0),
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ))),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
