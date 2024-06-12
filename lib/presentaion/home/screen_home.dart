import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/application/controller/now_playing/now_playing.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/controller/top_rated/top_rated.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/now_playing/now_playing.dart';
import 'package:netflix/application/model/popular/popular.dart';
import 'package:netflix/application/model/upcoming/upcoming.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/home/widgets/background_card.dart';
import 'package:netflix/presentaion/home/widgets/main_card_home.dart';

import 'package:netflix/presentaion/home/widgets/number_title_card.dart';

import '../../application/model/top_rated/top_rated.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<TopRated> topRated = [];
  List<Popular> popular = [];
  List<Upcoming> upcoming = [];
  List<NowPlaying> newplaying = [];
  Future getAllMovies() async {
    topRated = await getTopRatedMovies();
    popular = await getAllPopular();
    upcoming = await getAllUpcoming();
    newplaying = await getAllNowPlaying();

    //   setState(() {});
  }

  @override
  void initState() {
    getAllMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: ((notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                }),
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          movies: topRated,
                          titletext: 'Released in the past year',
                        ),
                        kheight,
                        MainTitleCard(
                          movies: upcoming,
                          titletext: 'Trending Now',
                        ),
                        kheight,
                        NumberTitleCard(
                          upcoming: newplaying,
                        ),
                        kheight,
                        MainTitleCard(
                          movies: topRated,
                          titletext: 'Tensed Dramas',
                        ),
                        kheight,
                        MainTitleCard(
                          movies: popular,
                          titletext: 'South Indian Dramas',
                        ),
                      ],
                    ),
                    scrollNotifier.value == true
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              width: double.infinity,
                              height: 80,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        'https://upload.wikimedia.org/wikipedia/commons/f/ff/Netflix-new-icon.png',
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      kwidth,
                                      Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.blue,
                                      ),
                                      kwidth
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('TV Shows', style: kHomeTitleText),
                                      Text(
                                        'Movies',
                                        style: kHomeTitleText,
                                      ),
                                      Text(
                                        'catagories',
                                        style: kHomeTitleText,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        : kheight,
                  ],
                ),
              );
            }));
  }
}
