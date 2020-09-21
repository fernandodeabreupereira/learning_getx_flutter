import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/pages/first.dart';
import 'package:test_getx/pages/second.dart';
import 'package:test_getx/pages/third.dart';
import 'package:test_getx/shared/binding/sample_bind.dart';
import 'package:test_getx/shared/transitions/transition.dart';
import 'package:test_getx/shared/translations/translation.dart';

void main() {
  runApp(GetMaterialApp(
    // It is not mandatory to use named routes, but dynamic urls are interesting.
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    color: Colors.white,
    defaultTransition: Transition.native,
    translations: MyTranslations(),
    locale: Locale('pt', 'BR'),
    getPages: [
      //Simple GetPage
      GetPage(
        name: '/home',
        page: () => First(),
        customTransition: SizeTransitions(),
      ),
      // GetPage with custom transitions and bindings
      GetPage(
        name: '/second',
        page: () => Second(),
        customTransition: SizeTransitions(),
        binding: SampleBind(),
      ),
      // GetPage with default transitions
      GetPage(
        name: '/third',
        transition: Transition.cupertino,
        page: () => Third(),
        customTransition: SizeTransitions(),
      ),
    ],
  ));
}
