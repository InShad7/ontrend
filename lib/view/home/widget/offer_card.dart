import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import 'star_rating.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
    required this.img,
    required this.title,
    required this.offerPrice,
    required this.mrpPrice,
    this.ht = 140,
    this.isRestaurantCard = false,
  });

  final String img;
  final String title;
  final String offerPrice;
  final String mrpPrice;
  final double ht;
  final bool isRestaurantCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ht,
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(13.r),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 5.w,
            ),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.black.withOpacity(0.7),
                  blurRadius: 13.0,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                isRestaurantCard
                    ? const SizedBox()
                    : Text(
                        'starting from',
                        style: GoogleFonts.roboto(
                          color: CustomColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      offerPrice,
                      style: GoogleFonts.roboto(
                        color: isRestaurantCard
                            ? CustomColors.white
                            : CustomColors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    isRestaurantCard
                        ? const StarRating()
                        : Text(
                            mrpPrice,
                            style: GoogleFonts.roboto(
                              color: CustomColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
