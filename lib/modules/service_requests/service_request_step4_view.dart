import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salephone_user/modules/dashboard/dashboard_view.dart';
import '../../common_view/common_widgets.dart';
import '../../controllers/service_request_controller.dart';
import '../../utility/color_utility.dart';

class ServiceRequestStepFour extends StatefulWidget {
  final String serviceId;
  const ServiceRequestStepFour({Key? key, required this.serviceId})
      : super(key: key);

  @override
  State<ServiceRequestStepFour> createState() => _ServiceRequestStepFourState();
}

class _ServiceRequestStepFourState extends State<ServiceRequestStepFour> {
  @override
  void initState() {
    ServiceRequestController.to.getOurService(serviceId: widget.serviceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const DashboardView());
        return true;
      },
      child: commonStructure(
          context: context,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return ServiceRequestController.to.createdService.value.id != null
                  ? ListView(
                      children: [
                        commonVerticalSpacing10(height: 20),
                        Row(
                          children: [
                            commonHeaderTitle(
                                title: "Service Requested",
                                ourFontColor: whiteColor,
                                fontSize: 2.0,
                                fontWeight: 2),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: successColor,
                                                      width: 2)),
                                              child: commonHeaderTitle(
                                                  ourFontColor: blackColor,
                                                  fontSize: 1.0,
                                                  fontWeight: 1,
                                                  align: TextAlign.left,
                                                  title:
                                                      "${ServiceRequestController.to.createdService.value.deviceDetails?.brandName} ${ServiceRequestController.to.createdService.value.deviceDetails?.model} ${ServiceRequestController.to.createdService.value.deviceDetails?.color} ${ServiceRequestController.to.createdService.value.deviceDetails?.storage} IMEI/SERIAL - NO:${ServiceRequestController.to.createdService.value.deviceDetails?.serialNo}"),
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
                                  children: ServiceRequestController
                                      .to.createdService.value.categories!
                                      .map((e) {
                                    return Container(
                                        margin: const EdgeInsets.all(5),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: blackColor,
                                            borderRadius:
                                                BorderRadius.circular(4)),
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
                                          "${ServiceRequestController.to.createdService.value.issue}",
                                      ourFontColor: blackColor,
                                      height: 1.3,
                                      fontWeight: 1,
                                      align: TextAlign.left)),
                              commonVerticalSpacing10(height: 20),
                              Row(
                                children: [
                                  commonHeaderTitle(
                                      title: "Personal Information",
                                      ourFontColor: whiteColor,
                                      fontSize: 1.4,
                                      fontWeight: 0),
                                ],
                              ),
                              commonVerticalSpacing10(),
                              Row(
                                children: [
                                  commonHeaderTitle(
                                      title:
                                          "Full Name: ${ServiceRequestController.to.createdService.value.personalInformation?.fullName ?? ""}",
                                      fontSize: 0.90,
                                      align: TextAlign.left),
                                ],
                              ),
                              commonVerticalSpacing10(height: 5),
                              Row(
                                children: [
                                  commonHeaderTitle(
                                      title:
                                          "Mo no/Whatsapp no: ${ServiceRequestController.to.createdService.value.personalInformation?.mobileNumber ?? ""}",
                                      fontSize: 0.90,
                                      align: TextAlign.left),
                                ],
                              ),
                              commonVerticalSpacing10(height: 5),
                              Row(
                                children: [
                                  commonHeaderTitle(
                                      title:
                                          "Email: ${ServiceRequestController.to.createdService.value.personalInformation?.email ?? ""}",
                                      fontSize: 0.90,
                                      align: TextAlign.left),
                                ],
                              ),
                              commonVerticalSpacing10(height: 5),
                              Row(
                                children: [
                                  commonHeaderTitle(
                                      title:
                                          "PinCode: ${ServiceRequestController.to.createdService.value.personalInformation?.pinCode ?? ""}",
                                      fontSize: 0.90,
                                      align: TextAlign.left),
                                ],
                              ),
                              commonVerticalSpacing10(),
                            ],
                          ),
                        ),
                        commonVerticalSpacing10(height: 20),
                        commonHeaderTitle(
                            title:
                                "Your service reference id is: ${ServiceRequestController.to.createdService.value.referenceId}",
                            ourFontColor: successColor,
                            fontSize: 0.90),
                        commonVerticalSpacing10(),
                        commonHeaderTitle(
                            height: 1.3,
                            title:
                                "You will soon receive phone call on +91 ${ServiceRequestController.to.createdService.value.personalInformation?.mobileNumber ?? ""}\n for further details & verification",
                            fontSize: 0.90),
                        commonVerticalSpacing10(),
                        commonHeaderTitle(
                            height: 1.3,
                            title:
                                "Meanwhile you can track your service status on homepage.",
                            fontSize: 0.90),
                        commonVerticalSpacing10(),
                        commonHeaderTitle(
                            height: 1.3, title: "Thank you.", fontSize: 0.90)
                      ],
                    )
                  : Container();
            }),
          )),
    );
  }
}
