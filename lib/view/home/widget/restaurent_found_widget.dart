import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import 'star_rating.dart';

class RestaurentFoundWidget extends StatelessWidget {
  const RestaurentFoundWidget({super.key, this.isSecondCard = false});
  final bool isSecondCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Kconstants.kHeight20,
        isSecondCard
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Restaurants to Explore (1288 found)',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    color: CustomColors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w),
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 8.0,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 162.w,
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.r),
                    topLeft: Radius.circular(10.r),
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/dominos_banner.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Domino\'s Pizza',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: CustomColors.black,
                          ),
                        ),
                        StarRating(
                          radius: 7,
                          padding: 5.w,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pizza,Pasta,Desserts',
                          style: GoogleFonts.roboto(
                            fontSize: 16.w,
                            color: CustomColors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 8,
                            ),
                            Kconstants.kWidth5,
                            Text(
                              'OMR 27 for one',
                              style: GoogleFonts.roboto(
                                fontSize: 16.w,
                                color: CustomColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse_sharp,
                                  size: 25.sp,
                                  color: CustomColors.blue2,
                                ),
                                Kconstants.kWidth5,
                                Text(
                                  '40-45 mins',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.w,
                                    color: CustomColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 8,
                                ),
                                Kconstants.kWidth5,
                                Text(
                                  '6.8 Km',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.w,
                                    color: CustomColors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Salalah',
                              style: GoogleFonts.roboto(
                                fontSize: 16.w,
                                color: CustomColors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Kconstants.kWidth,
                            Icon(
                              Icons.location_on_outlined,
                              size: 20.sp,
                              color: CustomColors.btnClrOrange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
