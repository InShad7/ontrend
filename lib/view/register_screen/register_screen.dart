import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrend/view/login_screen/widget/custom_btn.dart';
import 'package:ontrend/view/utils/colors.dart';
import 'package:ontrend/view/utils/constants.dart';
import 'package:provider/provider.dart';

import '../../controller/controller.dart';
import '../login_screen/widget/custom_field.dart';
import 'widget/country_code_picker.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);

    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: AppBar(
        foregroundColor: CustomColors.white,
        backgroundColor: CustomColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            provider.firstNameController.clear();
            provider.lastNameController.clear();
            provider.emailController.clear();
            provider.phoneNumberController.clear();
            provider.passwordController.clear();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: CustomColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: provider.formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Register",
                  style: GoogleFonts.roboto(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Just a few things to get started",
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.grey,
                  ),
                ),
              ),
              Kconstants.kHeight20,
              CustomTextField(
                title: 'First Name',
                myControler: provider.firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Name';
                  }
                  return null;
                },
              ),
              Kconstants.kHeight5,
              CustomTextField(
                title: 'Last Name',
                myControler: provider.lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              Kconstants.kHeight5,
              CustomTextField(
                title: "Email",
                myControler: provider.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              Kconstants.kHeight5,
              MyCountryCodePicker(
                hintText: 'Phone Number',
                controller: provider.phoneNumberController,
                borderColor: Colors.transparent,
                dropIconColor: CustomColors.grey,
                dropdownTextColor: CustomColors.grey,
                focusedBorderColor: CustomColors.grey,
                hintTextColor: CustomColors.grey,
              ),
              Kconstants.kHeight5,
              CustomTextField(
                title: "Create Password",
                myControler: provider.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid password';
                  } else if (value.length < 8) {
                    return 'Please enter minimum 8 characters';
                  }
                  return null;
                },
              ),
              Kconstants.kHeight50,
              CustomBtn(
                onPressed: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  if (provider.formKey2.currentState!.validate()) {
                    if (provider.phoneNumberController.text.isNotEmpty) {
                      final success = await provider.registerUser();
                      if (success) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    } else {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                          msg: 'Please enter a valid phone number');
                    }
                  } else {
                    Navigator.pop(context);
                    Fluttertoast.showToast(
                        msg: 'Pleasae enter valid credentials');
                  }
                },
                color: CustomColors.btnClrOrange,
                title: 'Register',
                titleColor: CustomColors.white,
              ),
              Kconstants.kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Already have an account? ',
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      provider.firstNameController.clear();
                      provider.lastNameController.clear();
                      provider.emailController.clear();
                      provider.phoneNumberController.clear();
                      provider.passwordController.clear();
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.roboto(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.blue2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
