import 'package:get/get.dart';

import 'transform_main_logic.dart';

class TransformMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransformMainLogic());
  }
}
