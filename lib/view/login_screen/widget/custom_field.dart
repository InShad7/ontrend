import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ontrend/view/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.title,
    // required this.icon,
    required this.myControler,
    this.readOnly = false,
    this.validator,
    this.maxlen,
    // this.keyboardType,
    this.isNumber = false,
    this.iconOnTap,
    this.obsecureText = false,
    this.leadingIcon,
    this.isPassword = false,
    this.capitlization,
    this.maxLine = 1,
    this.isLeading = false,
    this.isSuffixIcon = false,
    this.leadingColor,
  });
  String title;
  final TextEditingController myControler;
  // IconData? icon;
  final bool readOnly;
  final validator;
  final maxlen;
  // final keyboardType;
  final isNumber;
  final iconOnTap;
  final obsecureText;
  final leadingIcon;
  final isPassword;
  final capitlization;
  final maxLine;
  final isLeading;
  final leadingColor;
  final bool isSuffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordView = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, right: 15.w),
      child: Container(
        padding: EdgeInsets.only(left: 12.w),
        margin: EdgeInsets.all(4.h),
        // height: ht,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColors.grey,
              blurRadius: 8.0,
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
          color: CustomColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0.h),
          child: TextFormField(
            textCapitalization: widget.capitlization ?? TextCapitalization.none,
            obscureText: widget.isPassword ? isPasswordView : false,
            maxLength: widget.maxlen,
            maxLines: widget.maxLine,
            inputFormatters: [
              widget.isNumber
                  ? FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  : FilteringTextInputFormatter.allow(
                      RegExp(r"[a-zA-Z0-9 @.+_-]"),
                    ),
            ],
            validator: widget.validator,
            readOnly: widget.readOnly,
            // keyboardType: widget.keyboardType,
            controller: widget.myControler,
            cursorColor: CustomColors.blue,
            style: TextStyle(color: CustomColors.black),
            decoration: InputDecoration(
              icon: widget.isLeading
                  ? Icon(
                      widget.leadingIcon,
                      color: widget.leadingColor,
                    )
                  : null,
              counterText: '',
              border: const OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(5.h),
              hintText: widget.title,
              hintStyle: TextStyle(fontSize: 16.sp, color: CustomColors.grey),
              hintMaxLines: 1,
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordView = !isPasswordView;
                        });
                      },
                      child: isPasswordView
                          ? Icon(
                              Icons.remove_red_eye,
                              color: CustomColors.grey,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: CustomColors.grey,
                            ),
                    )
                  : widget.isSuffixIcon
                      ? Icon(
                          Icons.mic,
                          color: CustomColors.btnClrOrange,
                        )
                      : null,
            ),
          ),
        ),
      ),
    );
  }
}
