import 'package:flutter/material.dart';
import 'package:netflix/application/model/now_playing/now_playing.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/number_card.dart';
import 'package:netflix/presentaion/widgets/main_title.dart';



class NumberTitleCard extends StatelessWidget {
  final List<NowPlaying> upcoming;
  const NumberTitleCard({
    super.key, required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       const   MainTitle(title: 'Top 10 TV shows in India Today'),
             kheight,
           LimitedBox(
            maxHeight: 200,
             child: ListView(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              
              children: List.generate(10, (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Numbercard(
                        index: index, image: upcoming[index].imagePath),
                  )),
             ),
           )
          ],
        );
  }
}


