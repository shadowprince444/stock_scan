import 'package:get/get.dart';

import '../controllers/variable_details_controller.dart';

class VariableDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VariableDetailsController>(
      () => VariableDetailsController(),
    );
  }
}
