
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/top_rated/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/top_rated/top_rated.dart';
import 'package:netflix/application/model/upcoming/upcoming.dart';

import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';


import 'package:netflix/presentaion/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/presentaion/new_and_hot/widgets/everyones_watching_widget.dart';




class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<TopRated> comingMovies = [];
  List<Upcoming> everyOne = [];

  Future getAllMovies() async {
    comingMovies = await getTopRatedMovies();
    everyOne = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: PreferredSize(preferredSize: const Size.fromHeight(80),child: AppBar(
        title:  const Text('New & Hot',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: kwhiteColor),),
        actions: [ const Icon(Icons.cast,color: Colors.white,size: 30,),
          kwidth,
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),kwidth],
          bottom:  TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: kblackColor,
            labelStyle: const TextStyle(fontSize: 16,fontWeight:FontWeight.bold ),
            unselectedLabelColor: kwhiteColor,
            indicator: BoxDecoration(color: kwhiteColor,borderRadius:kradius30 ),
            tabs: const [
            Tab(text: '🍿Coming soon',),
            Tab(text: '👀 Everyone,s Watching',)
          ]),
       )
        ),
        body: Padding(
            padding:const EdgeInsets.only(top: 8.0),
            child: TabBarView(children: [
              ComingSoon(
                comingMovies: comingMovies,
              ),
              EveryonesWatching(everyone: everyOne)
           ]),
)
      ),
    );
  }

 
}

// ignore: must_be_immutable
class ComingSoon extends StatelessWidget {
  ComingSoon({super.key, required this.comingMovies});
  List<TopRated> comingMovies = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: comingMovies.length,
        itemBuilder: (context, index) {
          return ComingSoonWidget(
            size: size,
            topRated: comingMovies[index],
          );
        });
  }
}

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({super.key, required this.everyone});
  final List<Upcoming> everyone;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, index) {
          return EveryOnesWatching(upcoming: everyone[index]);
        });
  }
}

