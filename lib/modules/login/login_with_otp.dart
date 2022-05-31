import 'package:flutter/material.dart';
import '../../common_view/common_widgets.dart';
import '../../constants/constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../utility/color_utility.dart';
import '../../utility/common_methods.dart';
import '../../utility/common_textField.dart';

class LoginWithOTP extends StatefulWidget {
  final String loginId;
  final String mobileNumber;
  const LoginWithOTP(
      {Key? key, required this.loginId, required this.mobileNumber})
      : super(key: key);

  @override
  State<LoginWithOTP> createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends State<LoginWithOTP> {
  TextEditingController otpController = TextEditingController();
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
                            fontSize: 1.5,
                            fontWeight: 2),
                      ),
                    ),
                  ],
                ),
                commonVerticalSpacing10(height: 50),
                commonHeaderTitle(
                    title: "Enter OTP", fontSize: 2.0, fontWeight: 3),
                commonVerticalSpacing10(height: 20),
                CommonTextFiled(
                    fieldTitleText: "Enter OTP",
                    hintText: "",
                    validationFunction: (value) {
                      return value.toString().isEmpty
                          ? notEmptyFieldMessage
                          : null;
                    },
                    textEditingController: otpController),
                commonVerticalSpacing10(height: 20),
                commonFillButtonView(
                    width: getScreenWidth(context: context) / 2,
                    context: context,
                    color: Colors.red.withOpacity(0.7),
                    title: "Login",
                    tapOnButton: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        AuthenticationController.to.verifyOTPAPI(
                            uniqueId: widget.loginId, otp: otpController.text);
                      }
                    },
                    isLoading: false),
                commonVerticalSpacing10(height: 20),
                commonHeaderTitle(
                    title:
                        "OTP sent to registered mobile\nnumber ending ${widget.mobileNumber}",
                    fontSize: 1.7,
                    fontWeight: 2),
              ],
            ),
          ),
        ));
  }
}
