import 'package:flutter/material.dart';
import 'package:ontrend/view/login_screen/widget/custom_field.dart';
import 'package:ontrend/view/utils/colors.dart';
import 'package:ontrend/view/utils/constants.dart';

import 'widget/category_widget.dart';
import 'widget/custom_app_bar.dart';
import 'widget/custom_curosel.dart';
import 'widget/offer_widget.dart';
import 'widget/restaurent_found_widget.dart';
import 'widget/restaurents_near_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              title: 'Dishes,Restaurents,Burgers,Pizza....',
              myControler: searchController,
              isLeading: true,
              leadingIcon: Icons.search,
              leadingColor: CustomColors.btnClrOrange,
              isSuffixIcon: true,
            ),
            Kconstants.kHeight,
            const CustomCurosel(),
            CategoryWidget(),
            const OfferWidget(),
            const RestaurentsNearYouWidget(),
            const RestaurentFoundWidget(),
            const RestaurentFoundWidget(isSecondCard: true),
          ],
        ),
      ),
    );
  }
}
