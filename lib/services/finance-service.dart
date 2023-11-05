import 'package:dio/dio.dart';
import 'package:expanse_tracker/model/finance.dart';
import 'package:expanse_tracker/pages/history-detail.dart';

import '../helper/session-manager.dart';

class FinanceService {
  static Future<Response> getCategory() async {
    Response response =
        await Dio().get('http://127.0.0.1:8000/api/v1/categories');

    return response;
  }

  static Future<List<FinanceData>> getFinance(int id) async {
    var token = await SessionManager.getToken();
    // print("token : $token");
    Response response = await Dio().get('http://127.0.0.1:8000/api/v1/finance',
        queryParameters: {'category_id': id},
        options: Options(headers: {"Authorization": "Bearer $token"}));

    // print(response.data['data'].length);
    List<FinanceData> financeData = (response.data['data'] as List)
        .map((e) => FinanceData.fromJson(e))
        .toList();

    // print(financeData[0].userId);

    return financeData;
  }
}
