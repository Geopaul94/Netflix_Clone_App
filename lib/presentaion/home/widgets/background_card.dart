
import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage(kmainImage))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  title: 'My List ',
                  icon: Icons.add,
                ),
                _playButton(),
                const CustomButtonWidget(icon: Icons.info, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: kradius10,
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kblackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'play',
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
