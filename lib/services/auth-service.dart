import 'package:dio/dio.dart';
import 'package:expanse_tracker/helper/session-manager.dart';

class AuthService {
  Future<bool> login(String email, password) async {
    try {
      Response response = await Dio().post('http://127.0.0.1:8000/api/v1/login',
          data: {'email': email, 'password': password});

      if (!response.data['status_error']) {
        await SessionManager.saveToken(response.data['token']);
        return true;
      } else {
        print(response.data['message']);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(String name, email, password) async {
    try {
      Response response = await Dio().post(
          'http://127.0.0.1:8000/api/v1/register',
          data: {'name': name, 'email': email, 'password': password});

      if (!response.data['status_error']) {
        await SessionManager.saveToken(response.data['token']);
        return true;
      } else {
        print(response.data['message']);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void logout() async {
    await SessionManager.removeToken();
  }
}
