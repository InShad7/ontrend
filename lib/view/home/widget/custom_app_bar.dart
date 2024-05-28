import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrend/view/home/widget/custom_icon_btn.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/location_pin.png',
                scale: 5,
                color: CustomColors.btnClrOrange,
              ),
              Kconstants.kWidth,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Janub Ad Dahariz',
                    style: GoogleFonts.roboto(
                      color: CustomColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    'Salalah, Oman',
                    style: GoogleFonts.roboto(
                      color: CustomColors.blue2,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              CustomIconBtn(
                icon: Icons.favorite_border,
                onTap: () {},
              ),
              Kconstants.kWidth,
              CustomIconBtn(
                icon: Icons.notifications_none_rounded,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
