import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  
final _widgetList = [const _SmartDownloads(),
         Section2(),
         const Section3()];
   

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:const PreferredSize(preferredSize: Size.fromHeight(50),child: AppBarWidget(title: "Downloads",),
      ),
      body:ListView.separated(
        padding:const EdgeInsets.all(10),
        itemBuilder:(ctx,index)=>_widgetList[index], separatorBuilder: (ctx,index)=>const SizedBox(height: 25,), itemCount: _widgetList.length)
    );
  }
}
class Section2 extends StatelessWidget {
  Section2({super.key});
  final List<String> imageList =['https://image.tmdb.org/t/p/original/uxzzxijgPIY7slzFvMotPv8wjKA.jpg','https://image.tmdb.org/t/p/original/rzRb63TldOKdKydCvWJM8B6EkPM.jpg','https://image.tmdb.org/t/p/original/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg'];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        const  Text('Indroducing Downloads for you',style: TextStyle(color: kwhiteColor,fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        kheight,
          const Text('We will download a personalized selection of movies and shows for you so there is always something to watch on your device',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontSize: 16),),
          kheight,
          SizedBox(width: media.width,
          height: media.width,
          
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(radius:media.width*0.4,
              backgroundColor: Colors.grey.withOpacity(0.5),),
              DownloadsImageWidget(imageList: imageList[2],margin: const EdgeInsets.only(left: 170,top: 50),angle: 25,size: Size(media.width*0.35, media.width*0.55),),
              DownloadsImageWidget(imageList: imageList[0],margin: const EdgeInsets.only(right: 170,top: 50),angle: -25,size: Size(media.width*0.35, media.width*0.55),),
              DownloadsImageWidget(imageList: imageList[1],margin: const EdgeInsets.only(bottom: 50,top: 50),size: Size(media.width*0.4, media.width*0.6),),
            ],
          ),), 

      ],
    );
  }
}
class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
  SizedBox(width: double.infinity,
    child: MaterialButton(onPressed: (){},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ),
            color:kbuttonColorblue ,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Setup',style: TextStyle(color: kwhiteColor,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            ),
  ),
  kheight,
           MaterialButton(onPressed: (){},
           shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          color:kbuttonColorwhite ,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('See what you can download',style: TextStyle(color: kblackColor,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          )
      ],
    );
  }
}
class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.settings,color: kwhiteColor,),
        kwidth,
        Text('Smart downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
   this.angle=0, required this.margin, required this.size
  });

  
  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi /180,
        child: Container(
          // margin: margin,
          width: size.width,
        height: size.height,
                     
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           color: kblackColor,
           image: DecorationImage(image: NetworkImage(imageList)),
        ),
        ),
      ),
    );
  }
}