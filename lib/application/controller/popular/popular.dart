import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/popular/popular.dart';



String getUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=7a15902b17b04e18db644fe8e3f72345';

Future<List<Popular>> getAllPopular() async {
  int c =3;
  while(c>=0){
 final response = await http.get(Uri.parse(getUrl));
  if (response.statusCode==200) {
    final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = PopularList.fromJson(bodyAsJson['results']);
  if (kDebugMode) {
    print(data.popularList[0].overview);
  }
  return data.popularList;
  }
  c --;
  }
 return [];
}