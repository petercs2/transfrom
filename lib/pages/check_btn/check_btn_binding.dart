import 'package:get/get.dart';

import 'check_btn_logic.dart';

class CheckBtnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckBtnLogic());
  }
}
