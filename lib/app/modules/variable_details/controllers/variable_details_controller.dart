import 'package:get/get.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';
import 'package:stock_scan/utils/screen_utils/size_config.dart';

class VariableDetailsController extends GetxController {
  late Variable variable;

  @override
  void onInit() {
    SizeConfig().init(Get.context!);
    variable = Get.arguments.first;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
