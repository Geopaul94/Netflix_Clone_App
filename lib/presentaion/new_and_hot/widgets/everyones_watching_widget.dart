import 'package:flutter/material.dart';
import 'package:netflix/application/model/upcoming/upcoming.dart';
import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/custom_button_widget.dart';
import 'package:netflix/presentaion/widgets/video_widget.dart';

class EveryOnesWatching extends StatelessWidget {
  final Upcoming upcoming;
  const EveryOnesWatching({
    super.key, required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        kheight,
          Text(upcoming.title,style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                 ),),
                 kheight,
                 Text(upcoming.overview,style: const TextStyle(
                  color: kgreyColor
                 ),
                 ),
                 kheight50,
                 VideoWidget(imagePath: imageBase+upcoming.imagePath,),
                 kheight,
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButtonWidget(icon: Icons.share , title: 'Share',iconsize: 25,textsize:16 ,),
                    kwidth,
                    CustomButtonWidget(icon: Icons.add , title: 'My List',iconsize: 25,textsize:16 ,),
                      kwidth,
                    CustomButtonWidget(icon: Icons.play_arrow , title: 'Play',iconsize: 25,textsize:16,),
                    kwidth
                  ],
                 )
    
      ]
    );
  }
}