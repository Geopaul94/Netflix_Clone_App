import 'package:flutter/material.dart';
import 'package:netflix/application/controller/upcoming/upcoming.dart';
import 'package:netflix/application/model/upcoming/upcoming.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/search/widget/title.dart';
const imageUrl = 'https://image.tmdb.org/t/p/original/p1AjA8ah8Ynjpcfl3bjVIeXZcYY.jpg';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  List<Upcoming> popular = [];
  Future getPopular() async {
    popular = await getAllUpcoming();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3.1,
        children: List.generate(popular.length, (index) {
          return MainCard(image: popular[index].imagePath);
        }),
      ))
      ],
    );
  }
}
class MainCard extends StatelessWidget {
  final String image;

  const MainCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        image: DecorationImage(image: 
        NetworkImage(imageBase+image),fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(7)
      ),
    );
  }
}