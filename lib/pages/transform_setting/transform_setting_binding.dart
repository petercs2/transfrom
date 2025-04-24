import 'package:get/get.dart';

import 'transform_setting_logic.dart';

class TransformSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransformSettingLogic());
  }
}
