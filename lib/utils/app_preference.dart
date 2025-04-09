import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }


  static Future<void> put(String key, dynamic value) async {
    if (prefs == null) await init();

    if (value == null) {
      await prefs!.remove(key);
    } else if (value is String) {
      await prefs!.setString(key, value);
    } else if (value is int) {
      await prefs!.setInt(key, value);
    } else if (value is bool) {
      await prefs!.setBool(key, value);
    } else if (value is double) {
      await prefs!.setDouble(key, value);
    }
  }


  static String? getString(String key) {
    return prefs?.getString(key);
  }


  static int? getInt(String key) {
    return prefs?.getInt(key);
  }

  static bool? getBool(String key) {
    return prefs?.getBool(key);
  }

  static Future<void> remove(String key) async {
    if (prefs == null) await init();
    await prefs!.remove(key);
  }

  static Future<void> clear() async {
    if (prefs == null) await init();
    await prefs!.clear();
  }
}
