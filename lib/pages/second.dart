import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_getx/shared/controllers/controller_x.dart';

class Second extends GetView<ControllerX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<ControllerX>(
              // Using bindings you don't need of init: method
              // Using Getx you can take controller instance of "builder: (_)"
              builder: (_) {
                print("count1 rebuild");
                return Text('${_.count1}');
              },
            ),
            GetX<ControllerX>(
              builder: (_) {
                print("count2 rebuild");
                return Text('${controller.count2}');
              },
            ),
            GetX<ControllerX>(builder: (_) {
              print("sum rebuild");
              return Text('${_.sum}');
            }),
            GetX<ControllerX>(
              builder: (_) => Text('Name: ${controller.user.value.name}'),
            ),
            GetX<ControllerX>(
              builder: (_) => Text('Age: ${_.user.value.age}'),
            ),
            RaisedButton(
              child: Text("Go to last page"),
              onPressed: () {
                Get.toNamed('/third', arguments: 'arguments of second');
              },
            ),
            RaisedButton(
              child: Text("Back page and open snackbar"),
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'User 123',
                  'Successfully created',
                );
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                Get.find<ControllerX>().increment();
              },
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: () {
                Get.find<ControllerX>().increment2();
              },
            ),
            RaisedButton(
              child: Text("Update name"),
              onPressed: () {
                Get.find<ControllerX>().updateUser();
              },
            ),
            RaisedButton(
              child: Text("Dispose worker"),
              onPressed: () {
                Get.find<ControllerX>().disposeWorker();
              },
            ),
          ],
        ),
      ),
    );
  }
}
