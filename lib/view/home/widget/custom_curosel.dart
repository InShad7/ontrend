import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ontrend/view/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCurosel extends StatefulWidget {
  const CustomCurosel({super.key, this.imgs});
  final imgs;

  @override
  State<CustomCurosel> createState() => _CustomCuroselState();
}

class _CustomCuroselState extends State<CustomCurosel> {
  int activeIndex = 0;
  List<String> imgUrl = [
    'assets/images/sliderImg.jpeg',
    'assets/images/sliderImg.jpeg',
    'assets/images/ecommerce_vector.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: imgUrl.length,
          itemBuilder: (context, index, realIndex) {
            final urlImg = imgUrl[index];
            return buildImage(urlImg, index);
          },
          options: CarouselOptions(
            viewportFraction: 0.93,
            height: 170,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
        ),
        buildIndicators(imgUrl.length),
      ],
    );
  }

  Widget buildImage(String imgUrl, int index) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: CustomColors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
              image: AssetImage(imgUrl),
              fit: BoxFit.contain,
            ),
          ),
        ),
      );

  Widget buildIndicators([length]) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: length,
        effect: const WormEffect(dotWidth: 10, dotHeight: 10),
      );
}
