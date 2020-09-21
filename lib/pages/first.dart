import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_getx/shared/controllers/controller.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.add),
          color: Colors.black,
          onPressed: () {
            Get.snackbar("Hi", "I'm modern snackbar");
          },
        ),
        title: Text(
          "title".trArgs(['John']),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
                init: Controller(),
                // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                builder: (_) => Text(
                      'clicks: ${_.count}',
                    )),
            RaisedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
            RaisedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.find<Controller>().increment();
          }),
    );
  }
}
