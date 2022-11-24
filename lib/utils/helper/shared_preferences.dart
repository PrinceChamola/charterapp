import 'dart:convert';
import 'dart:ffi';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences _prefsInstance;
  var _prefs;

  static const String _fcmToken = "fcmToken";
  static const String _isUserLogin = "isUserLogin";
  static const String _userModel = "userModel";

  static final JsonDecoder _decoder = JsonDecoder();
  static final JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  void clearAll() {
    _prefsInstance.clear();
  }

  static final SharedPreferenceHelper _singleton =
      SharedPreferenceHelper._internal();

  SharedPreferenceHelper._internal() {
    _prefs ??= SharedPreferences.getInstance();
  }

  factory SharedPreferenceHelper() {
    return _singleton;
  }

  T _getPref<T>(String key) {
    return _prefsInstance.get(key) as T;
  }

  String getFcmToken() {
    return _getPref(_fcmToken);
  }

  void saveFcmToken(String? token) {
    _savePref(_fcmToken, token);
  }

  _savePref(String key, Object? value) async {
    var prefs = _prefsInstance;
    if (prefs.containsKey(key)) {
      prefs.remove(key);
    }
    if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is String) {
      return prefs.setString(key, value);
    } else if (value is Double || value is Float) {
      return prefs.setDouble(key, value as double);
    }
  }
}
