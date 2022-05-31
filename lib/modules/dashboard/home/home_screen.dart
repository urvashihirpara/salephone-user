import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salephone_user/common_view/common_widgets.dart';
import 'package:salephone_user/controllers/service_request_controller.dart';
import 'package:salephone_user/modules/service_requests/service_request_step1_view.dart';
import 'package:salephone_user/utility/color_utility.dart';
import 'package:salephone_user/utility/common_methods.dart';

import '../../service_requests/track_service_request_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> myListArray = [1, 2, 3, 4, 5];
  int dotIndicatorIndex = 0;

  @override
  void initState() {
    ServiceRequestController.to.getAllServices();
    super.initState();
  }

  Widget actionCardView({String title = ""}) {
    return roundedBorderContainer(
        context: context,
        child: Row(
          children: [
            const Icon(
              Icons.design_services_outlined,
              color: Colors.lightBlue,
            ),
            commonHorizontalSpacing7(),
            commonHeaderTitle(
                title: title, ourFontColor: blackColor, fontSize: 0.95)
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        commonVerticalSpacing10(),
        commonHeaderTitle(
            title: "Premium Service Provider", fontSize: 1.7, fontWeight: 1),
        commonVerticalSpacing10(height: 20),
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  dotIndicatorIndex = index;
                });
              }),
          items: myListArray.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return roundedBorderContainer(
                    context: context,
                    child: Center(
                      child: Text(
                        'text $i',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        commonVerticalSpacing10(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: myListArray.map(
            (image) {
              //these two lines
              int index = myListArray.indexOf(image); //are changed
              return Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: whiteColor),
                    color: dotIndicatorIndex == index
                        ? whiteColor
                        : Colors.transparent),
              );
            },
          ).toList(),
        ),
        commonVerticalSpacing10(height: 20),
        commonHeaderTitle(
            title: "Track Service",
            fontSize: 1.4,
            fontWeight: 1,
            align: TextAlign.left),
        commonVerticalSpacing10(height: 20),
        SizedBox(
          height: 125,
          child: Obx(() {
            return ServiceRequestController.to.servicesList.isNotEmpty
                ? ListView.builder(
                    itemCount: ServiceRequestController.to.servicesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => TrackServiceRequestView(
                              serviceId: ServiceRequestController
                                      .to.servicesList[index].id ??
                                  ""));
                        },
                        child: roundedBorderContainer(
                            context: context,
                            child: SizedBox(
                              width: getScreenWidth(context: context) / 1.4,
                              height: 125,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      commonHeaderTitle(
                                          title:
                                              "Reference Id: ${ServiceRequestController.to.servicesList[index].referenceId}",
                                          fontSize: 0.80,
                                          fontWeight: 1,
                                          ourFontColor: Colors.grey[700]!,
                                          align: TextAlign.left),
                                    ],
                                  ),
                                  commonVerticalSpacing10(height: 5),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Container(
                                              height: 90,
                                              decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/default_image.png'),
                                                      fit: BoxFit.fill)))),
                                      commonHorizontalSpacing7(width: 10),
                                      Expanded(
                                          flex: 5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              commonHeaderTitle(
                                                  title:
                                                      "${ServiceRequestController.to.servicesList[index].deviceDetails?.brandName} ${ServiceRequestController.to.servicesList[index].deviceDetails?.model}",
                                                  fontSize: 1.4,
                                                  fontWeight: 1,
                                                  ourFontColor: blackColor,
                                                  align: TextAlign.left),
                                              commonVerticalSpacing10(
                                                  height: 8),
                                              commonHeaderTitle(
                                                  title:
                                                      "${ServiceRequestController.to.servicesList[index].deviceDetails?.storage},${ServiceRequestController.to.servicesList[index].deviceDetails?.color}, ${ServiceRequestController.to.servicesList[index].deviceDetails?.serialNo}",
                                                  fontSize: 0.90,
                                                  fontWeight: 1,
                                                  ourFontColor: Colors.grey,
                                                  align: TextAlign.left),
                                              commonVerticalSpacing10(
                                                  height: 5),
                                              commonHeaderTitle(
                                                  title:
                                                      "Type: ${ServiceRequestController.to.servicesList[index].type}",
                                                  fontSize: 0.95,
                                                  fontWeight: 1,
                                                  ourFontColor: successColor,
                                                  align: TextAlign.left),
                                              commonVerticalSpacing10(
                                                  height: 5),
                                              commonHeaderTitle(
                                                  title:
                                                      "Status: ${ServiceRequestController.to.servicesList[index].status}",
                                                  fontSize: 0.95,
                                                  fontWeight: 1,
                                                  ourFontColor: successColor,
                                                  align: TextAlign.left),
                                            ],
                                          )),
                                      const Expanded(
                                          flex: 1,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: blackColor,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                  )
                : Container();
          }),
        ),
        commonVerticalSpacing10(height: 20),
        commonHeaderTitle(
            title: "Actions",
            fontSize: 1.4,
            fontWeight: 1,
            align: TextAlign.left),
        commonVerticalSpacing10(height: 20),
        Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                Get.to(() => const ServiceRequestStepOne());
              },
              child: actionCardView(title: "Service\nRequest"),
            )),
            Expanded(child: actionCardView(title: "Your\nGuide")),
            Expanded(child: actionCardView(title: "Get\nin Touch")),
          ],
        ),
        commonVerticalSpacing10(height: 20),
        commonHeaderTitle(
            title: "What our customers says about us.",
            fontSize: 1.4,
            fontWeight: 1,
            align: TextAlign.left),
        commonVerticalSpacing10(),
        roundedBorderContainer(
            context: context,
            child: const SizedBox(
              height: 140,
            ))
      ],
    );
  }
}
