import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salephone_user/controllers/service_request_controller.dart';
import 'package:salephone_user/models/service_req_model.dart';
import 'package:salephone_user/modules/service_requests/service_request_step2_view.dart';
import '../../common_view/common_widgets.dart';
import '../../constants/constants.dart';
import '../../utility/color_utility.dart';
import '../../utility/common_methods.dart';
import '../../utility/common_textField.dart';

class ServiceRequestStepThree extends StatefulWidget {
  const ServiceRequestStepThree({Key? key}) : super(key: key);

  @override
  State<ServiceRequestStepThree> createState() =>
      _ServiceRequestStepThreeState();
}

class _ServiceRequestStepThreeState extends State<ServiceRequestStepThree> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  MaterialColor get getColor => Colors.green;

  Widget titleWithTextField(
      {String title = "", TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonHeaderTitle(
            title: title,
            ourFontColor: blackColor,
            fontSize: 1.0,
            fontWeight: 2),
        commonVerticalSpacing10(height: 5),
        CommonTextFiled(
            textFieldHeight: 40,
            fieldTitleText: title,
            hintText: "",
            keyboardType: title == "Full Name"
                ? TextInputType.text
                : title == "Email"
                    ? TextInputType.emailAddress
                    : TextInputType.number,
            inputFormatter: title == "Mobile no/Whatsapp no"
                ? [
                    FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                    LengthLimitingTextInputFormatter(10),
                  ]
                : [],
            isBorderEnable: true,
            validationFunction: (value) {
              if (title == "Mobile no/Whatsapp no") {
                return value.toString().isEmpty
                    ? notEmptyFieldMessage
                    : value.length != 10
                        ? validPhoneMessage
                        : null;
              } else if (title == "Email") {
                return value.toString().isEmpty
                    ? notEmptyFieldMessage
                    : !GetUtils.isEmail(value)
                        ? enterValidEmail
                        : null;
              } else {
                return value.toString().isEmpty ? notEmptyFieldMessage : null;
              }
            },
            textEditingController: controller!)
      ],
    );
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
                      title: "Device and problems details",
                      ourFontColor: whiteColor,
                      fontSize: 1.4,
                      fontWeight: 0),
                ],
              ),
              commonVerticalSpacing10(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: whiteColor, width: 2)),
                child: Column(
                  children: [
                    commonVerticalSpacing10(),
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
                                      title:
                                          "Fetching details for following device",
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
                            title: "Problem Category",
                            ourFontColor: whiteColor,
                            fontSize: 1.4,
                            fontWeight: 0),
                      ],
                    ),
                    commonVerticalSpacing10(),
                    roundedBorderContainer(
                      padding: 8,
                      context: context,
                      child: Wrap(
                        children: ServiceRequestController.to.allCategory
                            .where((p0) => p0.isChecked ?? false)
                            .map((e) {
                          return Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: blackColor,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                e.name ?? "",
                                style: const TextStyle(
                                    fontSize: 12, color: whiteColor),
                              ));
                        }).toList(),
                      ),
                    ),
                    commonVerticalSpacing10(height: 20),
                    Row(
                      children: [
                        commonHeaderTitle(
                            title: "Problem Description",
                            ourFontColor: whiteColor,
                            fontSize: 1.4,
                            fontWeight: 0),
                      ],
                    ),
                    commonVerticalSpacing10(),
                    roundedBorderContainer(
                        context: context,
                        child: commonHeaderTitle(
                            title:
                                "${ServiceRequestController.to.serviceReqModel.value.issue}",
                            ourFontColor: blackColor,
                            height: 1.3,
                            fontWeight: 1,
                            align: TextAlign.left)),
                    commonVerticalSpacing10(),
                  ],
                ),
              ),
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Enter your personal information",
                      ourFontColor: whiteColor,
                      fontSize: 1.2,
                      fontWeight: 0),
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
                            title: "Full Name", controller: nameController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "Mobile no/Whatsapp no",
                            controller: mobileController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "Email", controller: emailController),
                        commonVerticalSpacing10(height: 20),
                        titleWithTextField(
                            title: "PinCode", controller: pinCodeController),
                      ],
                    ),
                  )),
              commonVerticalSpacing10(height: 20),
              Row(
                children: [
                  commonHeaderTitle(
                      title: "Read all terms & conditions",
                      ourFontColor: whiteColor,
                      fontSize: 1.2,
                      fontWeight: 0),
                ],
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      fillColor: MaterialStateColor.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors
                                .green; // the color when checkbox is selected;
                          }
                          return Colors
                              .white; //the color when checkbox is unselected;
                        },
                      ),
                      tristate: false,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  commonHeaderTitle(
                      title: "Here by i accept all terms & conditions",
                      ourFontColor: whiteColor,
                      fontSize: 1.2,
                      fontWeight: 0),
                ],
              ),
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
                        Get.to(() => const ServiceRequestStepTwo());
                      },
                      isLoading: false),
                  commonFillButtonView(
                      height: 40,
                      color: whiteColor,
                      width: getScreenWidth(context: context) / 4,
                      fontColor: blackColor,
                      context: context,
                      title: "Submit",
                      tapOnButton: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          PersonalInfo personalInfo = PersonalInfo();
                          personalInfo.fullName = nameController.text;
                          personalInfo.mobileNumber = mobileController.text;
                          personalInfo.email = emailController.text;
                          personalInfo.pinCode = pinCodeController.text;
                          ServiceRequestController.to.serviceReqModel.value
                              .personalInformation = personalInfo;
                          ServiceRequestController.to.createServiceAPI();
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
