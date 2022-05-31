import 'package:get/get.dart';
import '../configuration/api_config.dart';
import '../configuration/api_service.dart';
import '../models/boolean_model.dart';
import 'package:dio/dio.dart' as dio;

import '../models/login_response_model.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/login/login_with_otp.dart';
import '../utility/common_methods.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get to => Get.find();

  void registerUserAPI(Map<String, dynamic> params) {
    apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.registerURL,
      success: (dio.Response<dynamic> response) {
        showSnackBar(
            title: ApiConfig.success, message: "Register Successfully");
        Get.back();
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void loginAPI(Map<String, dynamic> params) {
    apiServiceCall(
      params: params,
      serviceUrl: ApiConfig.loginURL,
      success: (dio.Response<dynamic> response) {
        showSnackBar(
            title: ApiConfig.success, message: "OTP Sent Successfully");
        Get.to(() => LoginWithOTP(
            loginId: response.data["data"]["id"],
            mobileNumber: params.values.first));
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void verifyOTPAPI({String? uniqueId, String otp = "000000"}) {
    apiServiceCall(
      params: {"user": uniqueId, "otp": otp},
      serviceUrl: ApiConfig.otpURL,
      success: (dio.Response<dynamic> response) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(response.data);
        setObject(ApiConfig.loginPref, loginResponseModel);
        setIsLogin(isLogin: true);
        Get.offAll(() => const DashboardView(),
            transition: Transition.rightToLeftWithFade);
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }
}

void errorHandling(dio.Response<dynamic> response) {
  BooleanResponseModel? responseData =
      BooleanResponseModel.fromJson(response.data);
  showSnackBar(title: ApiConfig.error, message: responseData.message ?? "");
}
