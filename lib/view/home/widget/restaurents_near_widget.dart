import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrend/view/utils/constants.dart';

import '../../utils/colors.dart';
import 'offer_card.dart';

class RestaurentsNearYouWidget extends StatelessWidget {
  const RestaurentsNearYouWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0.w),
          child: Text(
            'Top rated restaurents near you',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 16.w,
              color: CustomColors.black,
            ),
          ),
        ),
        Kconstants.kHeight,
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 170,
                child: const OfferCard(
                  isRestaurantCard: true,
                  ht: 200,
                  img: 'assets/images/shawarma.jpg',
                  title: 'Mc Donald\'s',
                  offerPrice: '40-45 mins',
                  mrpPrice: '',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
