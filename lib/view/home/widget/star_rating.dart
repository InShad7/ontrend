import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({
    super.key,
    this.padding = 1,
    this.radius = 3,
  });
  final double padding;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: CustomColors.green,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          Text(
            '4.1',
            style: GoogleFonts.roboto(
              color: CustomColors.white,
            ),
          ),
          Icon(
            Icons.star,
            size: 15.sp,
            color: CustomColors.white,
          ),
        ],
      ),
    );
  }
}
