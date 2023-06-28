import 'dart:async';
import 'dart:developer';

import 'package:ingorala_app/api_factory/api.dart';
import 'package:ingorala_app/api_factory/api_end_points.dart';
import 'package:ingorala_app/api_factory/prefs/pref_utils.dart';
import 'package:ingorala_app/api_factory/user_model.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {

  UserModel? _kCurrentUser;


  UserModel? get kCurrentUser => _kCurrentUser;

  set kCurrentUser(UserModel? value) {
    _kCurrentUser = value;
    notifyListeners();
  }


  void onInit() async {

    kCurrentUser = await PrefUtils.getUser();
  }


  clearUser() {
    kCurrentUser = null;
    notifyListeners();
  }

  logoutUserAPI({required BuildContext context, required String userId}) {
    Api.request(
      method: HttpMethod.post,
      path: ApiEndPoints.logout,
      params: {
        "UserId":userId
      },
      context: context,
      onResponse: (response) async {
        await PrefUtils.clearPrefs();

          // Navigator.of(context).pushAndRemoveUntil(
          //   MaterialPageRoute(
          //     builder: (context) => const LoginView(),
          //   ),
          //   (route) => false,
          // );

      },
    );
  }
}
