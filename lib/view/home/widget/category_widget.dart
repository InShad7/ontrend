import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
  });

  List<String> categoryList = [
    'assets/images/burger.png',
    'assets/images/cake.png',
    'assets/images/pizza.png',
    'assets/images/biryani.png',
    'assets/images/noodles.png',
  ];
  List<String> categoryNames = [
    'Burger',
    'Cake',
    'Pizza',
    'Biryani',
    'Noodles',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Categories',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 16.w,
              color: CustomColors.black,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.w),
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(13.r),
            boxShadow: [
              BoxShadow(
                color: CustomColors.grey,
                blurRadius: 8.0,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(6.w),
                      padding: EdgeInsets.all(4.w),
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            categoryList[index],
                          ),
                          index == 0
                              ? Kconstants.kHeight13
                              : Kconstants.kHeight5,
                          Text(
                            categoryNames[index],
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    final reversedIndex = categoryList.length - 1 - index;
                    return Container(
                      margin: EdgeInsets.all(6.w),
                      padding: EdgeInsets.all(4.w),
                      width: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            categoryList[reversedIndex],
                          ),
                          reversedIndex == 0
                              ? Kconstants.kHeight13
                              : Kconstants.kHeight5,
                          Text(
                            categoryNames[reversedIndex],
                            style: GoogleFonts.roboto(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
