import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/comic_model.dart';

class ComicRepository {
  final String apiKey =
      "870c7d0c39ec6fb344a28c500eb7dd1953596fb9"; // Tu API Key

  Future<List<Comic>> fetchComics() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://comicvine.gamespot.com/api/issues/?api_key=$apiKey&format=json",
        ),
        headers: {
          'User-Agent': 'ComicApp',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Imprimir toda la respuesta para inspeccionar los datos

        if (responseData.containsKey('results')) {
          final List comicsJson = responseData['results'];

          // Imprimir los datos de los comics

          return comicsJson.map((json) => Comic.fromJson(json)).toList();
        } else {
          throw Exception(
              "Unexpected response format: 'results' key not found");
        }
      } else {
        throw Exception("Failed to load comics");
      }
    } catch (e) {
      throw Exception("Failed to fetch comics due to an error");
    }
  }
}
