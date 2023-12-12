import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/controllers/controllers.dart';
import 'package:task_app/screens/home/edit_task.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => userController.userModel.length > 0
        ? ListView.builder(
            itemCount: userController.userModel.length,
            itemBuilder: (context, index) {
              return Container(
                color: Color.fromARGB(255, 249, 249, 249),
                child: Card(
                    child: ListTile(
                  title: Text(userController.userModel[index].title!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {
                              Get.to(EditTask(
                                id: userController.userModel[index].id,
                                title: userController.userModel[index].title,
                                amount: userController.userModel[index].amount,
                              ));
                            },
                            icon: const Icon(Icons.edit)),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              showDailogBox(
                                  userController.userModel[index].id!);
                              // userController.deleteUser(
                              //     userController.userModel[index].id!);
                            },
                            icon: const Icon(Icons.delete),
                          )),
                    ],
                  ),
                )),
              );
            },
          )
        : const Center(child: Text('No items')));
  }

  Future showDailogBox(String id) {
    return Get.defaultDialog(
      title: "Delete Task",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete task ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        userController.deleteUser(id);
      },
    );
  }
}
