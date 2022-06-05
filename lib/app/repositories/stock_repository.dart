import 'package:stock_scan/app/data/models/api_response_model.dart';
import 'package:stock_scan/app/data/models/stocks_response_model.dart';
import 'package:stock_scan/app/interfaces/i_stock_repo.dart';
import 'package:stock_scan/app/services/dio_services.dart';
import 'package:stock_scan/utils/enums/general_enums.dart';

class StockRepository implements IStockRepo {
  final _dioClient = DioClient();

  @override
  Future<ApiResponse<List<StocksResponseModel>>> getStockDetails() async {
    try {
      final response = await _dioClient.request(
        uri: ApiUrls.stocks,
        method: ApiMethod.get,
      );

      List<StocksResponseModel> tempList = [];
      for (Map<String, dynamic> map in response.data) {
        tempList.add(StocksResponseModel.fromJson(map));
      }
      return ApiResponse<List<StocksResponseModel>>.completed(tempList);
    } catch (e) {
      return ApiResponse<List<StocksResponseModel>>.error(e.toString());
    }
  }
}
