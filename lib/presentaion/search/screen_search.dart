import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/application/controller/popular/popular.dart';
import 'package:netflix/application/model/popular/popular.dart';

import 'package:netflix/core/colours/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentaion/search/widget/search_idle.dart';

import 'package:netflix/presentaion/search/widget/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}


class _ScreenSearchState extends State<ScreenSearch> {
  final _controller = TextEditingController();
  List<Popular> popular = [];
  bool isTaped = true;
  Future getPopular() async {
    popular = await getAllPopular();
    setState(() {});
  }

  @override
  void initState() {
    getPopular();
    _controller.text = '';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                setState(() {
                  value.isEmpty ? isTaped = true : isTaped = false;
                });
              },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(CupertinoIcons.search,color: Colors.grey,),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
              style: const TextStyle(color: kwhiteColor),
              
              
            ),
            kheight,
            _isEmpty(_controller.text),
           
          // const Expanded(child:  SearchIdeWidget()),
          // const Expanded(child:  SearchResultWidget()),
           ],
        ),
      )
      ),
    );
  }
  Widget _isEmpty(String value) {
    return isTaped
        ? Expanded(child:SearchIdeWidget (popular: popular))
        : const Expanded(child: SearchResultWidget());
}
}