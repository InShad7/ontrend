import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../../controller/controller.dart';

class MyCountryCodePicker extends StatelessWidget {
  const MyCountryCodePicker({
    super.key,
    this.dropdownTextColor,
    this.dropIconColor,
    this.borderColor,
    this.focusedBorderColor,
    this.hintText,
    this.hintTextColor,
    this.controller,
  });

  final dropdownTextColor;
  final dropIconColor;
  final borderColor;
  final focusedBorderColor;
  final hintText;
  final hintTextColor;
  final controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, right: 15.w),
      child: Container(
        padding: EdgeInsets.only(left: 1.w),
        margin: EdgeInsets.all(4.h),
        // height: ht,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: IntlPhoneField(
          controller: controller,
          initialCountryCode: 'OM',
          flagsButtonPadding: const EdgeInsets.all(5),
          dropdownTextStyle: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: dropdownTextColor,
          ),
          dropdownIconPosition: IconPosition.trailing,
          dropdownIcon: Icon(
            Icons.expand_more,
            color: dropIconColor,
          ),
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: hintTextColor,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            hintText: hintText,
            hintStyle: GoogleFonts.roboto(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: hintTextColor,
            ),
            counterText: '',
            border: OutlineInputBorder(
              // borderSide: BorderSide(color: red),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          languageCode: "en",
          onChanged: (phone) {
            // NewsLetterAndSuggestionController.numberController.text =
            //     phone.number.toString();
            provider.selectedCountry = phone.countryCode;
          },
          onCountryChanged: (country) {
            // provider.selectedCountry = country.dialCode;
            print('Country changed to: ' + country.dialCode);
          },
        ),
      ),
    );
  }
}
