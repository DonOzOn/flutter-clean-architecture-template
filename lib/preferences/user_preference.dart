import 'package:shared_preferences/shared_preferences.dart';

import 'base_preferences.dart';

class UserPreference implements BasePreferences {
  late SharedPreferences _prefs;

  @override
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  double? getDouble(String key) => _prefs.getDouble(key);

  @override
  int? getInt(String key) => _prefs.getInt(key);

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  List<String>? getStringList(String key) => _prefs.getStringList(key);

  @override
  void setBool(String key, {required bool value}) {
    _prefs.setBool(key, value);
  }

  @override
  void setDouble(String key, double value) {
    _prefs.setDouble(key, value);
  }

  @override
  void setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  @override
  void setString(String key, String value) {
    _prefs.setString(key, value);
  }

  @override
  void setStringList(String key, List<String> value) {
    _prefs.setStringList(key, value);
  }

  @override
  void clear() {
    _prefs.clear();
  }

  @override
  void remove(String key) {
    _prefs.remove(key);
  }

  @override
  Future<void> reload() async {
    await _prefs.reload();
  }

  @override
  Future getValue(String key) async => _prefs.get(key);

  @override
  Future<bool> setValue(String key, value) {
    if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is String) {
      return _prefs.setString(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      throw Exception('Value type is not supported');
    }
  }
}
