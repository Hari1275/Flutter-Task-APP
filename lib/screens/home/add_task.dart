import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/add_task_controller.dart';
import 'package:task_app/controllers/controllers.dart';
import 'package:task_app/models/user.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // final UserController _usercontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    // final TextEditingController _title = TextEditingController();
    // final TextEditingController _amount = TextEditingController();
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
                            child: Text("Add your task"),
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
                                    userController.addUser();
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
