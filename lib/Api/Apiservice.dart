import 'package:dio/dio.dart';
import 'package:finalproject_vep/Api/endpoints.dart';
import 'package:finalproject_vep/models/commentsmodel.dart';
import 'package:finalproject_vep/models/postsmodel.dart';

class Apiservice {
  static const String baseurl = "https://jsonplaceholder.typicode.com/";
  Dio _dio = Dio();
  Future<List<Postsmodel>> getposts() async {
    Response response = await _dio.get("$baseurl${Endpoints.posts}");
    return (response.data as List)
        .map((json) => Postsmodel.fromjson(json))
        .toList();
  }

  Future<List<Commentsmodel>> getComments(int postId) async {
    Response response = await _dio
        .get("$baseurl${Endpoints.posts}/$postId/${Endpoints.comments}");
    return (response.data as List)
        .map((json) => Commentsmodel.fromjson(json))
        .toList();
  }

  Future<Postsmodel> getpost(int id) async {
    Response response = await _dio.get("$baseurl${Endpoints.posts}/$id");
    return Postsmodel.fromjson(response.data);
  }
}
