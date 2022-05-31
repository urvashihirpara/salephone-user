import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salephone_user/controllers/service_request_controller.dart';
import 'package:salephone_user/modules/service_requests/service_request_step1_view.dart';
import 'package:salephone_user/modules/service_requests/service_request_step3_view.dart';

import '../../common_view/common_widgets.dart';
import '../../utility/color_utility.dart';
import '../../utility/common_methods.dart';
import '../../utility/common_textField.dart';

class ServiceRequestStepTwo extends StatefulWidget {
  const ServiceRequestStepTwo({Key? key}) : super(key: key);

  @override
  State<ServiceRequestStepTwo> createState() => _ServiceRequestStepTwoState();
}

class _ServiceRequestStepTwoState extends State<ServiceRequestStepTwo> {
  TextEditingController describeController = TextEditingController();

  @override
  void initState() {
    ServiceRequestController.to.getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Tell us about your issue",
                      ourFontColor: whiteColor,
                      fontSize: 1.8,
                      fontWeight: 2),
                ],
              ),
              commonVerticalSpacing10(height: 20),
              roundedBorderContainer(
                  context: context,
                  child: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.design_services_outlined,
                          color: Colors.lightBlue,
                          size: 50,
                        ),
                      ),
                      commonHorizontalSpacing7(width: 15),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonHeaderTitle(
                                title: "Fetching details for following device",
                                ourFontColor: blackColor,
                                fontSize: 1.0,
                                fontWeight: 1,
                                align: TextAlign.left),
                            commonVerticalSpacing10(height: 5),
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: successColor, width: 2)),
                              child: commonHeaderTitle(
                                  ourFontColor: blackColor,
                                  fontSize: 1.0,
                                  fontWeight: 1,
                                  align: TextAlign.left,
                                  title:
                                      "${ServiceRequestController.to.serviceReqModel.value.deviceDetails?.brandName} ${ServiceRequestController.to.serviceReqModel.value.deviceDetails?.model} ${ServiceRequestController.to.serviceReqModel.value.deviceDetails?.color} ${ServiceRequestController.to.serviceReqModel.value.deviceDetails?.storage} IMEI/SERIAL - NO:${ServiceRequestController.to.serviceReqModel.value.deviceDetails?.serialNo}"),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Select Problem Category",
                      ourFontColor: whiteColor,
                      fontSize: 1.4,
                      fontWeight: 0),
                ],
              ),
              commonVerticalSpacing10(height: 20),
              roundedBorderContainer(
                context: context,
                child: Obx(() {
                  return ServiceRequestController.to.allCategory.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: ServiceRequestController.to.allCategory
                                  .map((e) {
                                return Stack(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          e.isChecked = !(e.isChecked ?? false);
                                        });
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.all(5),
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: blackColor,
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            e.name ?? "",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: whiteColor),
                                          )),
                                    ),
                                    Positioned(
                                        right: 0,
                                        top: -2,
                                        child: (e.isChecked ?? false)
                                            ? const Icon(
                                                Icons.check_circle,
                                                color: successColor,
                                                size: 14,
                                              )
                                            : Container())
                                  ],
                                );
                              }).toList(),
                            ),
                            commonVerticalSpacing10(height: 20),
                            commonHeaderTitle(
                                title:
                                    "Total ${ServiceRequestController.to.allCategory.where((element) => (element.isChecked ?? false)).length} problems selected",
                                ourFontColor: blackColor,
                                fontWeight: 1,
                                fontSize: 1.1)
                          ],
                        )
                      : Container();
                }),
              ),
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Describe your issue",
                      ourFontColor: whiteColor,
                      fontSize: 1.4,
                      fontWeight: 0),
                ],
              ),
              commonVerticalSpacing10(height: 20),
              CommonTextFiled(
                  textFieldHeight: 100,
                  fieldTitleText: "",
                  hintText: "",
                  maxLine: 7,
                  fillColor: Colors.transparent,
                  fontColor: whiteColor,
                  isBorderEnable: true,
                  borderColor: whiteColor,
                  validationFunction: (value) {},
                  textEditingController: describeController),
              commonVerticalSpacing10(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonFillButtonView(
                      height: 40,
                      width: getScreenWidth(context: context) / 4,
                      color: whiteColor,
                      fontColor: blackColor,
                      context: context,
                      title: "Previous",
                      tapOnButton: () {
                        Get.to(() => const ServiceRequestStepOne());
                      },
                      isLoading: false),
                  commonFillButtonView(
                      height: 40,
                      width: getScreenWidth(context: context) / 4,
                      color: whiteColor,
                      fontColor: blackColor,
                      context: context,
                      title: "Next",
                      tapOnButton: () {
                        ServiceRequestController.to.serviceReqModel.value
                            .issue = describeController.text;
                        ServiceRequestController
                                .to.serviceReqModel.value.categories =
                            ServiceRequestController.to.allCategory
                                .where((p0) => p0.isChecked ?? false)
                                .map((e) => e.id)
                                .cast<String>()
                                .toList();
                        Get.to(() => const ServiceRequestStepThree());
                      },
                      isLoading: false)
                ],
              )
            ],
          ),
        ));
  }
}

class ProblemCategoryModel {
  String title = "";
  bool isChecked = false;

  ProblemCategoryModel(String myTitle, bool isEnable) {
    title = myTitle;
    isChecked = isEnable;
  }
}
