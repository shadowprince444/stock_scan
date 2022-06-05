import 'package:get/get.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';

class VariableDetailsController extends GetxController {
  late Variable variable;
  @override
  void onInit() {
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
