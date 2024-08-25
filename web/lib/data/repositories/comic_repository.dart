import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/comic_model.dart';

class ComicRepository {
  final String apiKey = "870c7d0c39ec6fb344a28c500eb7dd1953596fb9";
  final String boxName = 'comicsBox';

  Future<List<Comic>> fetchComics() async {
    final box = await Hive.openBox<Comic>(boxName);

    try {
      final response = await http.get(
        Uri.parse(
            "https://comicvine.gamespot.com/api/issues/?api_key=$apiKey&format=json"),
        headers: {
          'User-Agent': 'ComicApp',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey('results')) {
          final List comicsJson = responseData['results'];
          final List<Comic> comics =
              comicsJson.map((json) => Comic.fromJson(json)).toList();

          // Guardar los cómics en Hive usando un mapa
          await box.clear(); // Opcional: Limpiar antes de guardar nuevos datos
          for (var i = 0; i < comics.length; i++) {
            await box.put('comic_$i', comics[i]);
          }

          return comics;
        } else {
          throw Exception(
              "Unexpected response format: 'results' key not found");
        }
      } else {
        throw Exception("Failed to load comics: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception caught: $e");

      // Recuperar los cómics desde Hive en caso de error
      final List<Comic> comics = [];
      for (var i = 0; i < box.length; i++) {
        final comic = box.get('comic_$i') as Comic?;
        if (comic != null) {
          comics.add(comic);
        }
      }

      if (comics != null && comics.isNotEmpty) {
        return comics;
      } else {
        throw Exception("Failed to fetch comics and no offline data available");
      }
    }
  }
}
