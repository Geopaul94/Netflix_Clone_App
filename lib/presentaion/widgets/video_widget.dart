

import 'package:flutter/material.dart';
import 'package:netflix/core/colours/colors.dart';


class VideoWidget extends StatelessWidget {
  final String imagePath;
  const VideoWidget({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: double.infinity,height: 200,child: Image.network(imagePath,fit: BoxFit.cover,),),
          Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              radius: 22,
                              child: IconButton(onPressed: (){}, icon: const Icon(
            
            Icons.volume_off,
            size: 20,
            color: kwhiteColor,
            
            ))),
          ),
      ],
    );
  }
}