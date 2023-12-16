abstract class BasePreferences {
  Future<void> initialize();
  bool? getBool(String key);
  int? getInt(String key);
  double? getDouble(String key);
  String? getString(String key);
  List<String>? getStringList(String key);
  Future getValue(String key);

  void setBool(String key, {required bool value});
  void setInt(String key, int value);
  void setDouble(String key, double value);
  void setString(String key, String value);
  void setStringList(String key, List<String> value);
  Future setValue(String key, value);
  Future<void> reload();

  void remove(String key);
  void clear();
}
