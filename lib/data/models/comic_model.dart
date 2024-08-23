import 'package:html/parser.dart' as html_parser;

class Comic {
  final String name;
  final String imageUrl;
  final String issueNumber;
  final String dateAdded;
  final String description;
  final List<String> creators;
  final List<String> characters;
  final List<String> teams;
  final List<String> locations;
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
