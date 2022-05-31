import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salephone_user/models/login_response_model.dart';
import '../configuration/api_config.dart';
import '../main.dart';

isNotEmptyString(String? string) {
  return string != null && string.isNotEmpty;
}

getScreenHeight({BuildContext? context}) {
  return MediaQuery.of(context!).size.height;
}

getScreenWidth({BuildContext? context}) {
  return MediaQuery.of(context!).size.width;
}

getCommonHorizontalPadding({double padding = 100.0}) {
  return EdgeInsets.symmetric(horizontal: padding);
}

getMobileHorizontalPadding({double padding = 40.0}) {
  return EdgeInsets.symmetric(horizontal: padding);
}

showSnackBar({required String title, required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: title.isEmpty || title == ApiConfig.warning
          ? const Color(0xffFFCC00)
          : title == ApiConfig.success
              ? Colors.green
              : Colors.red,
      textColor: Colors.white,
      fontSize: 12.0);
}

getDecodedURL(String? myString) {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return stringToBase64.decode(myString!);
}

setIsLogin({required bool isLogin}) {
  getPreferences.write('isLogin', isLogin);
}

bool getIsLogin() {
  return (getPreferences.read('isLogin') ?? false);
}

getObject(String key) {
  return getPreferences.read(key) != null
      ? json.decode(getPreferences.read(key))
      : null;
}

setObject(String key, value) {
  getPreferences.write(key, json.encode(value));
}

LoginResponseModel? getLoginData() {
  if (getObject(ApiConfig.loginPref) != null) {
    LoginResponseModel loginResponse =
        LoginResponseModel.fromJson(getObject(ApiConfig.loginPref));
    return loginResponse;
  } else {
    return null;
  }
}
