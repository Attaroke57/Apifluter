// services/api_service.dart

import 'dart:convert';
import 'package:latihan_api/PostModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?s=Soccer&c=Indonesia';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> data = jsonData['teams'];

      return data.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}