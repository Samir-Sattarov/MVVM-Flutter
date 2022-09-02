import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  Future<SharedPreferences> _initialize() async {
    return await SharedPreferences.getInstance();
  }

  saveValue({
    required String key,
    required String value,
  }) async {
    final storage = await _initialize();
    storage.setString(key, value);
  }

  Future<String?>? fetchValue({required String key}) async {
    final storage = await _initialize();
    final savedValue = storage.getString(key);
    return savedValue;
  }
}
