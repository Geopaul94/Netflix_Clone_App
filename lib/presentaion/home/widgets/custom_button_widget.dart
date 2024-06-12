import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colours/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconsize;
  final double textsize;
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconsize=30,
    this.textsize=18
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
          ),
        )
      ],
    );
  }
}
