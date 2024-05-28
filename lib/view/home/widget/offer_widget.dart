import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import 'offer_card.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                  'Offers',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.w,
                    color: CustomColors.black,
                  ),
                ),
              Text(
                'View All',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.w,
                  color: CustomColors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: OfferCard(
                  img: 'assets/images/pizza2.jpg',
                  title: 'Dominos Pizza',
                  offerPrice: 'OMR 10',
                  mrpPrice: 'OMR 50',
                ),
              ),
              Kconstants.kWidth,
              const Expanded(
                child: OfferCard(
                  img: 'assets/images/burger2.jpg',
                  title: 'Chard- Burger Grill And Spicy',
                  offerPrice: 'OMR 10',
                  mrpPrice: 'OMR 60',
                ),
              ),
            ],
          ),
          Kconstants.kHeight15,
          Row(
            children: [
              const Expanded(
                child: OfferCard(
                  img: 'assets/images/mix_pasta.jpg',
                  title: 'Mix Pasta(red and white)',
                  offerPrice: 'OMR 20',
                  mrpPrice: 'OMR 70',
                ),
              ),
              Kconstants.kWidth5,
              const Expanded(
                child: OfferCard(
                  img: 'assets/images/honey_chilly_potato.jpg',
                  title: 'Honey Chilly Potato',
                  offerPrice: 'OMR 15',
                  mrpPrice: 'OMR 50',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
