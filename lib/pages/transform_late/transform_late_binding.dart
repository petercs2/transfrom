import 'package:get/get.dart';

import 'transform_late_logic.dart';

class TransformLateBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
