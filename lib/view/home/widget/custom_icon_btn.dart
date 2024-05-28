import 'package:flutter/material.dart';
import 'package:ontrend/view/utils/colors.dart';

class CustomIconBtn extends StatelessWidget {
  const CustomIconBtn({
    super.key,
    required this.onTap,
    required this.icon,
  });

  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8.0,
              offset: const Offset(1, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: CustomColors.white,
          child: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
