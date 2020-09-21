import 'package:get/get.dart';
import 'package:test_getx/shared/controllers/controller_x.dart';

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllerX>(() => ControllerX());
  }
}
