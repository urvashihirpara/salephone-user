import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:salephone_user/utility/color_utility.dart';
import 'package:salephone_user/utility/common_methods.dart';
import '../../common_view/common_widgets.dart';
import '../../constants/constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../utility/common_textField.dart';
import '../signup/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController mobileNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                          color: whiteColor, shape: BoxShape.circle),
                      child: Center(
                        child: commonHeaderTitle(
                            title: "LOGO",
                            ourFontColor: blackColor,
                            fontSize: 1.7,
                            fontWeight: 2),
                      ),
                    ),
                  ],
                ),
                commonVerticalSpacing10(height: 50),
                commonHeaderTitle(
                    title: "Enter Mobile No", fontSize: 2.0, fontWeight: 3),
                commonVerticalSpacing10(height: 20),
                CommonTextFiled(
                    fieldTitleText: "Mobile No.",
                    hintText: "",
                    keyboardType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validationFunction: (value) {
                      return value.toString().isEmpty
                          ? notEmptyFieldMessage
                          : value.length != 10
                              ? validPhoneMessage
                              : null;
                    },
                    textEditingController: mobileNumberController),
                commonVerticalSpacing10(height: 20),
                commonFillButtonView(
                    width: getScreenWidth(context: context) / 2,
                    context: context,
                    color: Colors.red.withOpacity(0.7),
                    title: "Submit",
                    tapOnButton: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Map<String, dynamic> params = {
                          "phoneNumber": mobileNumberController.text
                        };
                        AuthenticationController.to.loginAPI(params);
                      }
                    },
                    isLoading: false),
                commonVerticalSpacing10(height: 20),
                doubleTextWithTap(
                    firstText: newUser,
                    secondText: createAccount,
                    tapEvent: () {
                      Get.to(() => const SignupView());
                    })
              ],
            ),
          ),
        ));
  }
}
