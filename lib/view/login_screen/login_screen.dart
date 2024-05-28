import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrend/controller/controller.dart';
import 'package:ontrend/view/home/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:ontrend/view/login_screen/widget/custom_btn.dart';
import 'package:ontrend/view/login_screen/widget/custom_field.dart';
import 'package:ontrend/view/register_screen/register_screen.dart';
import 'package:ontrend/view/utils/colors.dart';
import 'package:ontrend/view/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ecommerce_vector.jpeg',
                  scale: 1.1,
                ),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Kconstants.kHeight,
                CustomTextField(
                  title: 'Email or Phone',
                  myControler: provider.userNameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter username or phone number';
                    }
                  },
                ),
                Kconstants.kHeight,
                CustomTextField(
                  title: 'Password',
                  isPassword: true,
                  obsecureText: true,
                  myControler: provider.passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter password';
                    } else if (value.length < 8) {
                      return 'Please enter minimum 8 character';
                    }
                  },
                ),
                Kconstants.kHeight,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: 'forgot password');
                      },
                      child: Text(
                        'Forgot Password',
                        style: GoogleFonts.roboto(
                          color: CustomColors.blue2,
                        ),
                      ),
                    ),
                  ),
                ),
                Kconstants.kHeight30,
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
                    if (provider.formKey.currentState!.validate()) {
                      final success = await provider.checkUserCredentials();
                      if (success) {
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavBar(),
                            ),
                            (route) => false);

                        Fluttertoast.showToast(
                          msg: 'Logined successfully',
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    } else {
                      Navigator.pop(context);
                      Fluttertoast.showToast(
                        msg: 'Please enter valid credentials',
                      );
                    }
                  },
                  color: CustomColors.btnClrOrange,
                  title: 'Login',
                  titleColor: CustomColors.white,
                ),
                Kconstants.kHeight,
                GestureDetector(
                  onTap: () {
                    provider.userNameController.clear();
                    provider.passwordController.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: GoogleFonts.roboto(
                            color: CustomColors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        TextSpan(
                          text: ' Sign Up',
                          style: GoogleFonts.roboto(
                            color: CustomColors.blue2,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
