import 'package:get/get.dart';
import 'package:salephone_user/controllers/authentication_controller.dart';

import '../../controllers/general_controller.dart';
import '../../controllers/service_request_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<GeneralController>(GeneralController(), permanent: true);
    Get.put<ServiceRequestController>(ServiceRequestController(),
        permanent: true);
    Get.put<AuthenticationController>(AuthenticationController(),
        permanent: true);
  }
}
