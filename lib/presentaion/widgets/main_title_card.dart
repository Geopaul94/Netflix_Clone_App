// import 'package:flutter/material.dart';
// import 'package:netflix/core/constants.dart';
// import 'package:netflix/presentaion/search/widget/search_result.dart';

// import 'package:netflix/presentaion/widgets/main_title.dart';

// class MainTitleCard extends StatelessWidget {
//   final List movies;
//   final String title;
 
//   const MainTitleCard({
//     super.key, required this.title, required this.movies,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//       MainTitle(title: title),
//          kheight,
//        LimitedBox(
//         maxHeight: 200,
//          child: ListView(
//           // shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
          
//           children: List.generate(movies.length, (index) =>Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child:
//                         MainCard(image: imageBase + movies[index].imagePath))),
//          ),
//        )
//       ],
//     );
//   }
// }
