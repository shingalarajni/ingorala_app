import 'dart:convert';

import 'package:ingorala_app/api_factory/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pref_keys.dart';

class PrefUtils {
  PrefUtils();


  static setUserRole(String role) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.role, role);
  }
  static Future<String?> getUserRole() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.role);
  }

  static setUser(String userData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.user, userData);
  }

  static Future<UserModel> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Map<String, dynamic> user =
    jsonDecode(preferences.getString(PrefKeys.user) ?? "{}");
    return UserModel.fromJson(user);
  }

  static clearPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
