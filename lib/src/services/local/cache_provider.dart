import 'package:shared_preferences/shared_preferences.dart';

class CacheProvider {
  SharedPreferences? _preferences;

  CacheProvider() {
    _init();
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<String?> getStringValue(String key) async {
    if (_preferences == null) await _init();
    return _preferences!.getString(key);
  }

  Future<void> setStringValue(String key, String value) async {
    if (_preferences == null) await _init();
    _preferences!.setString(key, value);
  }
}
