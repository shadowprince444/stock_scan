import 'package:get/get.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';

class DetailsController extends GetxController {
  late StocksResponseModel stockModel;
  // final controller = TextEditingController();
  @override
  void onInit() {
    stockModel = Get.arguments[0];
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

  // List<String> getVariableString(Criteria criteria) {
  //   String tempString = criteria.text;
  //   String regString = "";
  //   criteria.variables.map((e) => regString = "$regString\\${e.jsonKey}");
  // }
}
