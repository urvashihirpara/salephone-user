import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/service_request_controller.dart';
import '../utility/color_utility.dart';
import '../utility/common_methods.dart';
import '../utility/theme_utility.dart';

double commonHorizontalPadding = 10.0;
double paragraphLineHeight = 1.5;
double subTitleFontFactor = 1.2;
double titleFontFactor = 2.0;
BorderRadius commonButtonBorderRadius = BorderRadius.circular(5.0);
BorderRadius commonBorderRadius = BorderRadius.circular(12.0);
List<BoxShadow> commonBoxShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 3,
    blurRadius: 6,
    offset: const Offset(0, 3),
  ),
];
BorderRadius commonRoundBorderRadius = BorderRadius.circular(20);
SizedBox commonVerticalSpacing10({double height = 10.0}) {
  return SizedBox(height: height);
}

SizedBox commonHorizontalSpacing7({double width = 5.0}) {
  return SizedBox(width: width);
}

AppBar commonAppBarWithOutSearch(BuildContext context, String title,
    {bool isTransparent = false,
    bool isLeading = true,
    List<Widget> actionWidgets = const [],
    bool isBottomBar = false,
    PreferredSizeWidget? tabBarView,
    Function? backButtonCallBack}) {
  return AppBar(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: isTransparent ? Brightness.light : Brightness.dark,
    ),
    // or use Brightness.dark
    elevation: 0.0,
    backgroundColor: blackColor,
    automaticallyImplyLeading: false,
    titleSpacing: 0,
    centerTitle: true,
    leading: isLeading
        ? InkWell(
            onTap: () {
              if (backButtonCallBack != null) {
                backButtonCallBack();
              } else {
                Get.back();
              }
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 15,
            ),
          )
        : Container(),
    title: Container(
      margin: const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: primary18PxW700.copyWith(color: whiteColor),
      ),
    ),
    actions: actionWidgets,
    bottom: isBottomBar ? tabBarView : null,
    // actions: actions != null ? actions : null,
  );
}

Widget commonBorderButtonView(
    {required BuildContext context,
    required String title,
    required Function tapOnButton,
    required bool isLoading,
    Color? color,
    double height = 50,
    IconData? iconData}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
    height: height,
    child: ElevatedButton(
      onPressed: () {
        if (!isLoading) {
          tapOnButton();
        }
      },
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        primary: Colors.transparent,
        side: const BorderSide(
          color: firstPrimaryColor,
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: commonBorderRadius,
        ),
        padding: EdgeInsets.symmetric(vertical: height == 50.0 ? 15 : 2),
        elevation: 0.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: primary14PxNormal.copyWith(
                color: firstPrimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: height >= 50.0 ? 16 : 12),
          ),
          iconData != null ? commonHorizontalSpacing7() : const SizedBox(),
          iconData != null
              ? Icon(
                  iconData,
                  size: 20,
                  color: firstPrimaryColor,
                )
              : const SizedBox(),
        ],
      ),
    ),
  );
}

Widget commonFillButtonView(
    {required BuildContext context,
    required String title,
    required Function tapOnButton,
    required bool isLoading,
    bool isLightButton = false,
    Color? color = firstPrimaryColor,
    Color? fontColor = whiteColor,
    double? height = 50.0,
    double? width}) {
  return Container(
      decoration: BoxDecoration(borderRadius: commonBorderRadius, color: color),
      width: width ??
          MediaQuery.of(context).size.width - (commonHorizontalPadding * 2),
      height: height,
      child: ElevatedButton(
          onPressed: () {
            if (!isLoading) {
              tapOnButton();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: commonBorderRadius),
            padding: const EdgeInsets.symmetric(vertical: 5),
            elevation: 0.0,
          ),
          child: Text(
            title,
            style: primary15PxW800.copyWith(
                color: fontColor, fontWeight: FontWeight.w500, fontSize: 18),
          )));
}

Widget commonStructure({
  required BuildContext context,
  required Widget child,
  AppBar? appBar,
  Widget? bottomNavigation,
}) {
  ///Pass null in appbar when it's optional ex = appBar : null
  return Stack(
    children: [
      commonAppBackground(),
      Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        bottomNavigationBar: bottomNavigation,

        ///adding listView cause scroll issue
        body: Container(
          height: getScreenHeight(context: context),
          color: Colors.transparent,
          child: child,
        ),
      ),
    ],
  );
}

Widget commonAppBackground() {
  return Container(
    decoration: const BoxDecoration(
      color: blackColor,
    ),
  );
}

Widget commonHeaderTitle(
    {TextAlign align = TextAlign.center,
    String? title,
    Color ourFontColor = whiteColor,
    int fontWeight = 0,
    double height = 1.0,
    double fontSize = 1}) {
  return Text(
    title ?? "",
    style: primary14PxNormal
        .apply(
            color: ourFontColor,
            fontSizeFactor: fontSize,
            fontFamily: "Montserrat",
            fontWeightDelta: fontWeight)
        .merge(TextStyle(height: height)),
    textAlign: align,
  );
}

Widget commonHeaderTitleWithMaxLines(
    {TextAlign align = TextAlign.center,
    String? title,
    Color ourFontColor = whiteColor,
    int fontWeight = 0,
    int maxLine = 1,
    double height = 1.0,
    double fontSize = 1}) {
  return Text(
    title ?? "",
    style: primary14PxNormal
        .apply(
            color: ourFontColor,
            fontSizeFactor: fontSize,
            fontFamily: "Montserrat",
            fontWeightDelta: fontWeight)
        .merge(TextStyle(height: height)),
    textAlign: align,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
  );
}

dialogStructure(BuildContext context, {required Widget child}) {
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          width: getScreenWidth(context: context) - 16,
          decoration: BoxDecoration(
            color: whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: child),
    ),
    useSafeArea: true,
    barrierDismissible: true,
    transitionCurve: Curves.easeInCubic,
    transitionDuration: const Duration(milliseconds: 400),
  );
}

containerWithDefaultShadow({Widget? child}) {
  return Card(
    elevation: 12,
    shadowColor: firstPrimaryColor.withOpacity(0.15),
    shape: RoundedRectangleBorder(
      // side: BorderSide(color: Colors.white70, width: 1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    ),
  );
}

textFieldWithTitle({String? title, Widget? child}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      commonHeaderTitle(
          title: title,
          ourFontColor: whiteColor,
          fontWeight: 2,
          align: TextAlign.start),
      commonVerticalSpacing10(),
      child!
    ],
  );
}

doubleTextWithTap(
    {String firstText = "", secondText = "", Function? tapEvent}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        firstText,
        style: primary14PxNormal.copyWith(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
      ),
      InkWell(
        onTap: () {
          tapEvent!();
        },
        child: Text(
          secondText,
          style: primary14PxNormal.copyWith(
              fontWeight: FontWeight.w500,
              color: firstPrimaryColor,
              fontSize: 16),
        ),
      ),
    ],
  );
}

commonSuggestionView({String? title}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    textBaseline: TextBaseline.ideographic,
    children: [
      Icon(Icons.check_circle, color: Colors.grey[600], size: 16),
      commonHorizontalSpacing7(),
      Flexible(
        child: commonHeaderTitle(
            title: title,
            fontSize: 0.95,
            ourFontColor: Colors.grey[800]!,
            align: TextAlign.start),
      )
    ],
  );
}

Widget imagePreviewForDocuments({File? myFile}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: FileImage(myFile!),
              fit: BoxFit.cover,
            )),
      ),
    ],
  );
}

Widget retakeImageButton() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: firstPrimaryColor)),
    child: commonHeaderTitle(
        title: "Retake Picture",
        fontSize: 0.98,
        ourFontColor: firstPrimaryColor,
        fontWeight: 2),
  );
}

void confirmationDialogView(
    {BuildContext? context,
    Function? firstCallback,
    secondCallback,
    String? title = "",
    subTitle = ""}) {
  showModalBottomSheet(
      context: context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              commonVerticalSpacing10(height: 30),
              commonHeaderTitle(
                  title: title,
                  fontWeight: 2,
                  height: 1.2,
                  ourFontColor: blackColor,
                  fontSize: 1.5),
              commonVerticalSpacing10(),
              commonHeaderTitle(
                title: subTitle,
                height: 1.3,
                ourFontColor: Colors.grey[800]!,
              ),
              commonVerticalSpacing10(height: 40),
              Row(
                children: [
                  Expanded(
                      child: commonBorderButtonView(
                          context: context,
                          title: "Yes",
                          tapOnButton: () async {
                            firstCallback!();
                          },
                          isLoading: false)),
                  commonHorizontalSpacing7(width: 15),
                  Expanded(
                    child: commonFillButtonView(
                        context: context,
                        title: "No",
                        tapOnButton: () async {
                          secondCallback!();
                        },
                        isLoading: false),
                  )
                ],
              )
            ],
          ),
        );
      });
}

Widget suggestionWidget(
    {String? firstTitle,
    secondTitle,
    thirdTitle,
    ExactAssetImage? image1,
    image2,
    image3}) {
  return Column(
    children: [
      Row(
        children: [
          commonHeaderTitle(
              title: firstTitle,
              fontSize: 0.95,
              ourFontColor: Colors.grey[800]!,
              align: TextAlign.left)
        ],
      ),
      commonVerticalSpacing10(height: 8),
      Row(
        children: [
          Image(image: image1!, height: 120),
        ],
      ),
      commonVerticalSpacing10(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          commonHeaderTitle(
            title: secondTitle,
            fontSize: 0.95,
            ourFontColor: Colors.grey[800]!,
          )
        ],
      ),
      commonVerticalSpacing10(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(image: image2, height: 120),
        ],
      ),
      commonVerticalSpacing10(height: 20),
      Row(
        children: [
          commonHeaderTitle(
            title: thirdTitle,
            fontSize: 0.95,
            ourFontColor: Colors.grey[800]!,
          )
        ],
      ),
      commonVerticalSpacing10(height: 8),
      Row(
        children: [
          Image(image: image3, height: 120),
        ],
      ),
    ],
  );
}

Widget roundedBorderContainer(
    {BuildContext? context,
    Widget? child,
    double padding = 8.0,
    Color color = whiteColor}) {
  return Container(
    padding: EdgeInsets.all(padding),
    // width: width ??
    //     MediaQuery.of(context!).size.width - (commonHorizontalPadding * 2),
    // height: height,
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(color: color, borderRadius: commonBorderRadius),
    child: child ?? Container(),
  );
}

Widget mainPhoneDetailView({BuildContext? context}) {
  return roundedBorderContainer(
      context: context,
      child: SizedBox(
        width: getScreenWidth(context: context) / 1.4,
        height: 115,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            commonVerticalSpacing10(height: 8),
            Row(
              children: [
                commonHorizontalSpacing7(width: 15),
                commonHeaderTitle(
                    title:
                        "Reference Id: ${ServiceRequestController.to.createdService.value.referenceId}",
                    fontSize: 0.80,
                    fontWeight: 1,
                    ourFontColor: Colors.grey[800]!,
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
                                image: AssetImage('assets/default_image.png'),
                                fit: BoxFit.fill)))),
                commonHorizontalSpacing7(width: 10),
                Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonHeaderTitle(
                            title:
                                "${ServiceRequestController.to.createdService.value.deviceDetails?.brandName} ${ServiceRequestController.to.createdService.value.deviceDetails?.model}",
                            fontSize: 1.4,
                            fontWeight: 1,
                            ourFontColor: blackColor,
                            align: TextAlign.left),
                        commonVerticalSpacing10(height: 8),
                        commonHeaderTitle(
                            title:
                                "${ServiceRequestController.to.createdService.value.deviceDetails?.storage},${ServiceRequestController.to.createdService.value.deviceDetails?.color}, ${ServiceRequestController.to.createdService.value.deviceDetails?.serialNo}",
                            fontSize: 0.90,
                            fontWeight: 1,
                            ourFontColor: Colors.grey,
                            align: TextAlign.left),
                        commonVerticalSpacing10(height: 5),
                        commonHeaderTitle(
                            title:
                                "Type: ${ServiceRequestController.to.createdService.value.type}",
                            fontSize: 0.95,
                            fontWeight: 1,
                            ourFontColor: successColor,
                            align: TextAlign.left),
                        commonVerticalSpacing10(height: 5),
                        commonHeaderTitle(
                            title:
                                "Status: ${ServiceRequestController.to.createdService.value.status}",
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
      ));
}
