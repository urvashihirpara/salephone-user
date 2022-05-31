import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salephone_user/utility/color_utility.dart';
import 'package:salephone_user/utility/common_methods.dart';

import '../../common_view/common_widgets.dart';
import '../../constants/constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../utility/common_textField.dart';
import '../login/login_screen.dart';
import 'package:flutter/services.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
          child: Center(
            child: Form(
              key: _formKey,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
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
                      title: "SignUp", fontSize: 2.0, fontWeight: 3),
                  commonVerticalSpacing10(height: 20),
                  textFieldWithTitle(
                      title: "Name",
                      child: CommonTextFiled(
                          fieldTitleText: "Enter Name",
                          hintText: "",
                          validationFunction: (value) {
                            return value.toString().isEmpty
                                ? notEmptyFieldMessage
                                : null;
                          },
                          textEditingController: nameController)),
                  commonVerticalSpacing10(height: 20),
                  textFieldWithTitle(
                      title: "Mobile No",
                      child: CommonTextFiled(
                          fieldTitleText: "Enter Mobile No",
                          hintText: "",
                          inputFormatter: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[0-9.,]+')),
                            LengthLimitingTextInputFormatter(10),
                          ],
                          keyboardType: TextInputType.number,
                          validationFunction: (value) {
                            return value.toString().isEmpty
                                ? notEmptyFieldMessage
                                : value.length != 10
                                    ? validPhoneMessage
                                    : null;
                          },
                          textEditingController: mobileController)),
                  commonVerticalSpacing10(height: 20),
                  textFieldWithTitle(
                      title: "Email",
                      child: CommonTextFiled(
                          fieldTitleText: "Enter email",
                          hintText: "",
                          keyboardType: TextInputType.emailAddress,
                          validationFunction: (value) {
                            return value.toString().isEmpty
                                ? notEmptyFieldMessage
                                : !GetUtils.isEmail(value)
                                    ? enterValidEmail
                                    : null;
                          },
                          textEditingController: emailAddressController)),
                  commonVerticalSpacing10(height: 20),
                  commonFillButtonView(
                      width: getScreenWidth(context: context) / 2,
                      context: context,
                      color: Colors.red.withOpacity(0.7),
                      title: "Signup",
                      tapOnButton: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Map<String, dynamic> params = {
                            "name": nameController.text,
                            "email": emailAddressController.text,
                            "phoneNumber": mobileController.text
                          };
                          AuthenticationController.to.registerUserAPI(params);
                        }
                      },
                      isLoading: false),
                  commonVerticalSpacing10(height: 20),
                  doubleTextWithTap(
                      firstText: haveAnAccount,
                      secondText: loginText,
                      tapEvent: () {
                        Get.offAll(() => const LoginView());
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
