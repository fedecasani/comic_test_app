import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/comic_model.dart';

class ComicRepository {
  final String apiKey = "your_api_key_here";

  Future<List<Comic>> fetchComics() async {
    final response = await http.get(Uri.parse(
        "https://comicvine.gamespot.com/api/issues/?api_key=$apiKey&format=json"));

    if (response.statusCode == 200) {
      final List comicsJson = json.decode(response.body)['results'];
      return comicsJson.map((json) => Comic.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load comics");
    }
  }
}
