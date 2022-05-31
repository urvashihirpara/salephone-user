import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salephone_user/utility/theme_utility.dart';

import '../common_view/common_widgets.dart';
import 'color_utility.dart';

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: const BorderSide(color: lightBgColor),
  borderRadius: commonButtonBorderRadius,
);

class CommonTextFiled extends StatefulWidget {
  final String fieldTitleText;
  final String hintText;
  final bool isPassword;
  final bool isBorderEnable;
  final bool isRequired;
  final TextEditingController textEditingController;
  final Function? validationFunction;
  final int? maxLength;
  final Function? onSavedFunction;
  final Function? onFieldSubmit;
  final TextInputType? keyboardType;
  final Function? onTapFunction;
  final Function? onChangedFunction;
  final List<TextInputFormatter>? inputFormatter;
  final bool isEnabled;
  final bool isReadOnly;
  final int? errorMaxLines;
  final int? maxLine;
  final FocusNode? textFocusNode;
  final GlobalKey<FormFieldState>? formFieldKey;
  final TextAlign align;
  final Widget? suffixIcon;
  final Color fontColor;
  final Widget? preFixIcon;
  final bool isShowTitle;
  final Color? fillColor;
  final Color? borderColor;
  final double textFieldHeight;

  const CommonTextFiled(
      {required this.fieldTitleText,
      required this.hintText,
      this.isPassword = false,
      this.isBorderEnable = false,
      this.isRequired = true,
      required this.textEditingController,
      this.validationFunction,
      this.maxLength,
      this.onSavedFunction,
      this.onFieldSubmit,
      this.keyboardType,
      this.onTapFunction,
      this.onChangedFunction,
      this.inputFormatter,
      this.isEnabled = true,
      this.isReadOnly = false,
      this.errorMaxLines,
      this.maxLine,
      this.textFocusNode,
      this.formFieldKey,
      this.align = TextAlign.start,
      this.suffixIcon,
      this.preFixIcon,
      this.isShowTitle = false,
      this.fontColor = blackColor,
      this.fillColor = whiteColor,
      this.textFieldHeight = 50,
      this.borderColor = blackColor});

  @override
  _CommonTextFiledState createState() => _CommonTextFiledState();
}

class _CommonTextFiledState extends State<CommonTextFiled> {
  bool? passwordVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      setState(() {
        passwordVisible = widget.isPassword;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.textFieldHeight,
      child: TextFormField(
        enabled: !widget.isEnabled ? false : true,
        textAlign: widget.align,
        showCursor: !widget.isReadOnly,
        onTap: () {
          if (widget.onTapFunction != null) {
            widget.onTapFunction!();
          }
        },
        key: widget.key,
        focusNode: widget.textFocusNode,
        onChanged: (value) {
          if (widget.onChangedFunction != null) {
            widget.onChangedFunction!(value);
          }
        },
        validator: (value) {
          return widget.validationFunction != null
              ? widget.validationFunction!(value)
              : null;
        },
        // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
        onSaved: (value) {
          // ignore: void_checks
          return widget.onSavedFunction != null
              ? widget.onSavedFunction!(value)
              : null;
        },
        onFieldSubmitted: (value) {
          // ignore: void_checks
          return widget.onFieldSubmit != null
              ? widget.onFieldSubmit!(value)
              : null;
        },
        maxLines: widget.maxLine ?? 1,
        keyboardType: widget.keyboardType,
        controller: widget.textEditingController,
        cursorColor: widget.fontColor,
        // initialValue: initialText,
        obscureText: passwordVisible!,
        style: primary16PxW700.copyWith(
            color: widget.fontColor, fontWeight: FontWeight.normal),
        inputFormatters: widget.inputFormatter,
        decoration: InputDecoration(
          labelStyle: primary14PxBold.copyWith(
              fontSize: widget.textFieldHeight <= 50 ? 14 : 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey),
          labelText: widget.fieldTitleText,
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorMaxLines: widget.errorMaxLines ?? 1,
          filled: true,
          contentPadding: const EdgeInsets.only(top: 10, left: 15),
          focusedBorder: widget.isBorderEnable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor!, width: 3),
                  borderRadius: commonButtonBorderRadius,
                )
              : textFieldBorderStyle,
          disabledBorder: widget.isBorderEnable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor!, width: 3),
                  borderRadius: commonButtonBorderRadius,
                )
              : textFieldBorderStyle,
          enabledBorder: widget.isBorderEnable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor!, width: 3),
                  borderRadius: commonButtonBorderRadius,
                )
              : textFieldBorderStyle,
          errorBorder: widget.isBorderEnable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor!, width: 3),
                  borderRadius: commonButtonBorderRadius,
                )
              : textFieldBorderStyle,
          focusedErrorBorder: widget.isBorderEnable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: widget.borderColor!, width: 3),
                  borderRadius: commonButtonBorderRadius,
                )
              : textFieldBorderStyle,
          hintText: widget.hintText,
          fillColor: widget.fillColor,
          hintStyle: primary14PxNormal.copyWith(
              color: Colors.grey,
              fontSize: widget.textFieldHeight <= 50 ? 14 : 18),
          suffixIcon: widget.isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible!;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: passwordVisible!
                        ? const Icon(
                            Icons.visibility_off,
                            color: firstPrimaryColor,
                          )
                        : const Icon(
                            Icons.remove_red_eye_sharp,
                            color: firstPrimaryColor,
                          ),
                  ))
              : widget.suffixIcon,
          prefixIcon: widget.preFixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.preFixIcon,
                )
              : null,
        ),
      ),
    );
  }
}
