import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salephone_user/common_view/common_widgets.dart';
import 'package:salephone_user/controllers/service_request_controller.dart';
import 'package:salephone_user/models/service_req_model.dart';
import 'package:salephone_user/utility/common_methods.dart';

import '../../constants/constants.dart';
import '../../utility/color_utility.dart';
import '../../utility/common_textField.dart';
import 'service_request_step2_view.dart';

class ServiceRequestStepOne extends StatefulWidget {
  const ServiceRequestStepOne({Key? key}) : super(key: key);

  @override
  State<ServiceRequestStepOne> createState() => _ServiceRequestStepOneState();
}

class _ServiceRequestStepOneState extends State<ServiceRequestStepOne> {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController storageController = TextEditingController();
  TextEditingController imeiController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget titleWithTextField(
      {String title = "", TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonHeaderTitle(
            title: title,
            ourFontColor: blackColor,
            fontSize: 1.5,
            fontWeight: 2),
        commonVerticalSpacing10(height: 5),
        CommonTextFiled(
            fieldTitleText: title,
            hintText: "",
            isBorderEnable: true,
            validationFunction: (value) {
              return value.toString().isEmpty ? notEmptyFieldMessage : null;
            },
            textEditingController: controller!)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        // bottomNavigation: Padding(
        //   padding: const EdgeInsets.only(bottom: 16, right: 16),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       commonFillButtonView(
        //           color: whiteColor,
        //           width: getScreenWidth(context: context) / 4,
        //           fontColor: blackColor,
        //           context: context,
        //           title: "Next",
        //           tapOnButton: () {
        //             Get.to(() => const ServiceRequestStepTwo());
        //           },
        //           isLoading: false)
        //     ],
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              commonVerticalSpacing10(height: 20),
              roundedBorderContainer(
                  context: context,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.design_services_outlined,
                        color: Colors.lightBlue,
                        size: 50,
                      ),
                      commonHorizontalSpacing7(width: 15),
                      commonHeaderTitle(
                          title: "Service Request",
                          ourFontColor: blackColor,
                          fontSize: 2.1,
                          fontWeight: 2)
                    ],
                  )),
              commonVerticalSpacing10(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: whiteColor, width: 4)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        commonHeaderTitle(
                            title: "Service Request for",
                            fontSize: 1.5,
                            fontWeight: 1,
                            align: TextAlign.left),
                      ],
                    ),
                    commonVerticalSpacing10(height: 20),
                    Row(
                      children: [
                        Expanded(
                            child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            roundedBorderContainer(
                              context: context,
                              child: Center(
                                child: commonHeaderTitle(
                                    title: "Same Device",
                                    ourFontColor: blackColor,
                                    fontWeight: 1,
                                    fontSize: 1.5),
                              ),
                            ),
                            const Positioned(
                                right: 0,
                                top: -10,
                                child: Icon(
                                  Icons.check_circle,
                                  color: successColor,
                                ))
                          ],
                        )),
                        commonHorizontalSpacing7(width: 12),
                        Expanded(
                            child: Stack(
                          children: [
                            roundedBorderContainer(
                              context: context,
                              child: Center(
                                child: commonHeaderTitle(
                                    title: "Other Device",
                                    ourFontColor: blackColor,
                                    fontWeight: 1,
                                    fontSize: 1.5),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                    commonVerticalSpacing10(),
                  ],
                ),
              ),
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Enter Device Details",
                      ourFontColor: whiteColor,
                      fontSize: 1.4,
                      fontWeight: 1),
                ],
              ),
              commonVerticalSpacing10(height: 20),
              roundedBorderContainer(
                  padding: 16,
                  context: context,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        titleWithTextField(
                            title: "Brand Name",
                            controller: brandNameController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "Model", controller: modelController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "Color", controller: colorController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "Storage", controller: storageController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "IMEI/SERIAL-No",
                            controller: imeiController),
                      ],
                    ),
                  )),
              commonVerticalSpacing10(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  commonFillButtonView(
                      color: whiteColor,
                      height: 40,
                      width: getScreenWidth(context: context) / 4,
                      fontColor: blackColor,
                      context: context,
                      title: "Next",
                      tapOnButton: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ServiceRequestController
                              .to.serviceReqModel.value.device = "Same Device";
                          DeviceDetails myDeviceDetail = DeviceDetails();
                          myDeviceDetail.model = modelController.text;
                          myDeviceDetail.brandName = brandNameController.text;
                          myDeviceDetail.color = colorController.text;
                          myDeviceDetail.storage = storageController.text;
                          myDeviceDetail.serialNo = imeiController.text;
                          ServiceRequestController.to.serviceReqModel.value
                              .deviceDetails = myDeviceDetail;
                          Get.to(() => const ServiceRequestStepTwo());
                        }
                      },
                      isLoading: false)
                ],
              )
            ],
          ),
        ));
  }
}
