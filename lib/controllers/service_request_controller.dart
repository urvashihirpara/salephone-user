import 'package:get/get.dart';
import 'package:salephone_user/models/category_response_model.dart';
import 'package:salephone_user/models/service_req_model.dart';
import 'package:salephone_user/models/service_response_model.dart';

import '../configuration/api_config.dart';
import '../configuration/api_service.dart';
import 'package:dio/dio.dart' as dio;

import '../modules/service_requests/service_request_step4_view.dart';
import 'authentication_controller.dart';

class ServiceRequestController extends GetxController {
  static ServiceRequestController get to => Get.find();

  RxList<Category> allCategory = RxList();
  Rx<ServiceRequestModel> serviceReqModel = ServiceRequestModel().obs;
  Rx<ServiceResponse> createdService = ServiceResponse().obs;
  RxList<ServiceResponse> servicesList = RxList();

  void getCategory() {
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.getCategoryURL,
      success: (dio.Response<dynamic> response) {
        CategoryResponseModel categoryResponseModel =
            CategoryResponseModel.fromJson(response.data);
        allCategory.addAll(categoryResponseModel.data ?? []);
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodGET,
    );
  }

  void createServiceAPI() {
    apiServiceCall(
      params: ServiceRequestController.to.serviceReqModel.value.toJson(),
      serviceUrl: ApiConfig.createServiceURL,
      success: (dio.Response<dynamic> response) {
        Get.to(() =>
            ServiceRequestStepFour(serviceId: response.data["data"]["_id"]));
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getOurService({String? serviceId}) {
    apiServiceCall(
      params: {"service": serviceId},
      serviceUrl: ApiConfig.getServiceURL,
      success: (dio.Response<dynamic> response) {
        ServiceResponseModel serviceResponseModel =
            ServiceResponseModel.fromJson(response.data);
        createdService.value = serviceResponseModel.data!;
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
    );
  }

  void getAllServices() {
    apiServiceCall(
      params: {},
      serviceUrl: ApiConfig.getAllServiceURL,
      success: (dio.Response<dynamic> response) {
        ServicesResponseModel servicesResponseModel =
            ServicesResponseModel.fromJson(response.data);
        servicesList.addAll(servicesResponseModel.data!);
      },
      error: (dio.Response<dynamic> response) {
        errorHandling(response);
      },
      isProgressShow: true,
      methodType: ApiConfig.methodGET,
    );
  }
}
