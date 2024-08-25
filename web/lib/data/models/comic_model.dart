import 'package:hive/hive.dart';
import 'package:html/parser.dart' as html_parser;

part 'comic_model.g.dart';

@HiveType(typeId: 0)
class Comic {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String issueNumber;

  @HiveField(3)
  final String dateAdded;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final List<String> creators;

  @HiveField(6)
  final List<String> characters;

  @HiveField(7)
  final List<String> teams;

  @HiveField(8)
  final List<String> locations;

  @HiveField(9)
  final List<String> concepts;

  Comic({
    required this.name,
    required this.imageUrl,
    required this.issueNumber,
    required this.dateAdded,
    required this.description,
    required this.creators,
    required this.characters,
    required this.teams,
    required this.locations,
    required this.concepts,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    // Limpia la descripción HTML
    String cleanDescription = json['description'] ?? 'No Description';
    cleanDescription = html_parser.parse(cleanDescription).body!.text;

    return Comic(
      name: json['name'] ?? json['volume']?['name'] ?? 'Unknown',
      imageUrl:
          json['image'] != null ? json['image']['original_url'] ?? '' : '',
      issueNumber: json['issue_number']?.toString() ?? 'N/A',
      dateAdded: json['cover_date'] ?? 'Unknown Date',
      description: cleanDescription,
      creators: (json['creators'] != null)
          ? List<String>.from(
              json['creators'].map((item) => item['name'] ?? 'Unknown'))
          : [],
      characters: (json['characters'] != null)
          ? List<String>.from(
              json['characters'].map((item) => item['name'] ?? 'Unknown'))
          : [],
      teams: (json['teams'] != null)
          ? List<String>.from(
              json['teams'].map((item) => item['name'] ?? 'Unknown'))
          : [],
      locations: (json['locations'] != null)
          ? List<String>.from(
              json['locations'].map((item) => item['name'] ?? 'Unknown'))
          : [],
      concepts: (json['concepts'] != null)
          ? List<String>.from(
              json['concepts'].map((item) => item['name'] ?? 'Unknown'))
          : [],
    );
  }
}
