import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../common_view/common_widgets.dart';
import '../../controllers/service_request_controller.dart';
import '../../utility/color_utility.dart';
import '../../utility/common_methods.dart';
import 'track_service_detail_screen.dart';

class TrackServiceRequestView extends StatefulWidget {
  final String serviceId;
  const TrackServiceRequestView({Key? key, required this.serviceId})
      : super(key: key);

  @override
  State<TrackServiceRequestView> createState() =>
      _TrackServiceRequestViewState();
}

class _TrackServiceRequestViewState extends State<TrackServiceRequestView> {
  @override
  void initState() {
    ServiceRequestController.to.getOurService(serviceId: widget.serviceId);
    super.initState();
  }

  Widget serviceStatusView(
      {bool isPlayView = true, String title = "", String date = ""}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isPlayView
            ? const Icon(
                Icons.play_arrow,
                color: dangerColor,
                size: 36,
              )
            : Container(),
        commonHorizontalSpacing7(width: isPlayView ? 7 : 0),
        InkWell(
          onTap: () {
            Get.to(() => const TrackServiceDetailScreen());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: commonBorderRadius, color: whiteColor),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonHeaderTitleWithMaxLines(
                        title: title,
                        fontWeight: 2,
                        fontSize: 1.7,
                        maxLine: 4,
                        ourFontColor: successColor),
                    commonVerticalSpacing10(height: 5),
                    commonHeaderTitle(
                        title: date,
                        fontWeight: 2,
                        fontSize: 1.2,
                        ourFontColor: dangerColor)
                  ],
                ),
                commonHorizontalSpacing7(width: 5),
                Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: blackColor, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: whiteColor,
                      size: 12,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: whiteColor),
                                ),
                                Container(
                                  height: getScreenHeight(context: context) / 2,
                                  width: 4,
                                  decoration:
                                      const BoxDecoration(color: whiteColor),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: whiteColor),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: ServiceRequestController.to
                                  .createdService.value.serviceStatus?.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return serviceStatusView(
                                    isPlayView: ServiceRequestController
                                                .to
                                                .createdService
                                                .value
                                                .serviceStatus![index]
                                                .status ==
                                            "Service Requested"
                                        ? false
                                        : true,
                                    date: DateFormat('dd, MMM yyyy hh:mm:ss a')
                                        .format(ServiceRequestController
                                            .to
                                            .createdService
                                            .value
                                            .serviceStatus![index]
                                            .date!),
                                    title: ServiceRequestController
                                            .to
                                            .createdService
                                            .value
                                            .serviceStatus![index]
                                            .status ??
                                        "");
                              },
                              // children: [
                              //   serviceStatusView(
                              //       isPlayView: false,
                              //       title: "Service Requested"),
                              //   commonVerticalSpacing10(height: 20),
                              //   serviceStatusView(title: "Working On Request"),
                              //   commonVerticalSpacing10(height: 20),
                              //   serviceStatusView(title: "Phone Call"),
                              //   commonVerticalSpacing10(height: 20),
                              //   // serviceStatusView(title: "Preparing Service Quote"),
                              // ],
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Container();
          }),
        ));
  }
}
