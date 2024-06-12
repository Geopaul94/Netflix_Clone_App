import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/application/model/popular/popular.dart';

import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/search/widget/title.dart';
const imageUrl ='https://lh4.googleusercontent.com/proxy/1q9NRpASuGN_cmmMoc2fvRiNs1QLWJicZ7kU5gv-OLrDKryPMjo4NoGIIoz39DPyvyh6nTrWqiphFjr-kLZrS2DDkXznp17DwwQ';
class SearchIdeWidget extends StatelessWidget {
  final  List<Popular> popular;
 const  SearchIdeWidget({super.key,required this .popular});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SearchTextTitle(title: 'Top Searches',),
            kheight,
           Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => TopSearchItemTile(
                  url: popular[index].imagePath,
                  movieName: popular[index].title),
              separatorBuilder: (ctx, index) => kheight20,
              itemCount: popular.length),
        )


      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  final String url;
  final String movieName;
  const TopSearchItemTile({super.key, required this.url, required this.movieName});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width:screenWidth*0.35 ,
          height: 70,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageBase+url),
              fit: BoxFit.cover
              )
          ),
        ),
        kwidth,
       Expanded(child: Text(movieName,style: const TextStyle(color: kwhiteColor,fontSize: 16,fontWeight: FontWeight.bold),)),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child:  CircleAvatar(
          backgroundColor: kblackColor,
          radius: 23,
          child: Icon(CupertinoIcons.play_fill,color: kwhiteColor,),
        ),
        )

      ],
    );
  }
}



