import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_view/common_widgets.dart';
import '../../controllers/service_request_controller.dart';
import '../../utility/color_utility.dart';

class TrackServiceDetailScreen extends StatefulWidget {
  const TrackServiceDetailScreen({Key? key}) : super(key: key);

  @override
  State<TrackServiceDetailScreen> createState() =>
      _TrackServiceDetailScreenState();
}

class _TrackServiceDetailScreenState extends State<TrackServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
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
                              title: "Track Service",
                              ourFontColor: whiteColor,
                              fontSize: 1.6,
                              fontWeight: 2),
                        ],
                      ),
                      commonVerticalSpacing10(height: 20),
                      mainPhoneDetailView(context: context),
                      commonVerticalSpacing10(height: 20),
                      roundedBorderContainer(
                          context: context,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: commonBorderRadius,
                                    color: whiteColor),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonHeaderTitleWithMaxLines(
                                            title: "Status",
                                            fontWeight: 2,
                                            fontSize: 1.7,
                                            maxLine: 4,
                                            ourFontColor: successColor),
                                        commonVerticalSpacing10(height: 5),
                                        commonHeaderTitle(
                                            title: "Date",
                                            fontWeight: 2,
                                            fontSize: 1.2,
                                            ourFontColor: dangerColor)
                                      ],
                                    ),
                                    commonHorizontalSpacing7(width: 5),
                                    Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                            color: blackColor,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: whiteColor,
                                          size: 12,
                                        ))
                                  ],
                                ),
                              ),
                              commonVerticalSpacing10(),
                              commonHeaderTitle(
                                  title:
                                      "As per the discussion on call & understanding more about your problem",
                                  ourFontColor: blackColor,
                                  fontSize: 1.3),
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
                                color: Colors.grey,
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
                                  color: Colors.grey,
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
                                      title: "Additional Notes",
                                      ourFontColor: whiteColor,
                                      fontSize: 1.4,
                                      fontWeight: 0),
                                ],
                              ),
                              commonVerticalSpacing10(),
                              roundedBorderContainer(
                                  color: Colors.grey,
                                  context: context,
                                  child: commonHeaderTitle(
                                      title:
                                          "Full Name: ${ServiceRequestController.to.createdService.value.personalInformation?.fullName ?? ""}\nMo no/Whatsapp no: ${ServiceRequestController.to.createdService.value.personalInformation?.mobileNumber ?? ""}\nEmail: ${ServiceRequestController.to.createdService.value.personalInformation?.email ?? ""}\nPinCode: ${ServiceRequestController.to.createdService.value.personalInformation?.pinCode ?? ""}",
                                      ourFontColor: blackColor,
                                      height: 1.3,
                                      fontWeight: 1,
                                      align: TextAlign.left)),
                              commonVerticalSpacing10(height: 20),
                              commonHeaderTitle(
                                  title:
                                      "This may be not final conclusion, it will be confirmed once we physically diagnose your device. We are preparing the estimated cost for your service and soon will update you for same.",
                                  ourFontColor: blackColor,
                                  fontSize: 1.3),
                              commonVerticalSpacing10(),
                            ],
                          ))
                    ],
                  )
                : Container();
          }),
        ));
  }
}
