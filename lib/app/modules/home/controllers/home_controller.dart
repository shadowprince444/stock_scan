import 'package:get/get.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';
import 'package:stock_scan/app/repositories/stock_repository.dart';
import 'package:stock_scan/utils/enums/general_enums.dart';
import 'package:stock_scan/utils/screen_utils/widgets/build_notification_snackbar.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  final _stocksRepo = StockRepository();
  final count = 0.obs;
  var stockList = <StocksResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchStockList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchStockList() async {
    isLoading.value = true;
    final res = await _stocksRepo.getStockDetails();
    if (res.status == ApiResponseStatus.completed) {
      stockList.value = res.data!;
    } else {
      buildSnackBar("${res.message}", "title");
    }
    isLoading.value = false;
  }
}
