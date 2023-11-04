import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionManager {
  static final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  static Future<void> removeToken() async {
    await secureStorage.delete(key: 'token');
  }
}
