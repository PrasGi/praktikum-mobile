import 'package:dio/dio.dart';

import '../helper/session-manager.dart';

class FinanceService {
  static void getFinance() async {
    String? token = await SessionManager.getToken();

    print(token);
  }
}
