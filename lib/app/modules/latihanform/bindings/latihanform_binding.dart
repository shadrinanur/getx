import 'package:get/get.dart';

import '../controllers/latihanform_controller.dart';

class LatihanformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanformController>(
      () => LatihanformController(),
    );
  }
}
