import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';


class MainCardHome extends StatelessWidget {
  const MainCardHome({super.key, required this.image});
  
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: kradius10,
            image: DecorationImage(
                image: NetworkImage(
                  imageBase + image,
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}