import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/top_rated/top_rated.dart';


String getUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=7a15902b17b04e18db644fe8e3f72345';

Future<List<TopRated>> getTopRatedMovies() async {
  int count = 3;
  
  while (count>=0) {
    if (kDebugMode) {
      print('hii');
    }
    final response = await http.get(Uri.parse(getUrl));
    if (kDebugMode) {
      print(response.statusCode);
    }
 if(response.statusCode==200){
  
   final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = TopRatedList.fromJson(bodyAsJson['results']);
if (kDebugMode) {
  print('test');
}
  return data.topRatedList;
 }count --;
  }
  return [];
}