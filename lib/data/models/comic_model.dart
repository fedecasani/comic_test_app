class Comic {
  final String name;
  final String imageUrl;
  final String issueNumber;
  final String dateAdded;

  Comic({
    required this.name,
    required this.imageUrl,
    required this.issueNumber,
    required this.dateAdded,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      name: json['name'] ??
          json['volume']?['name'] ??
          'Unknown', // Ajusta según la estructura correcta
      imageUrl:
          json['image'] != null ? json['image']['original_url'] ?? '' : '',
      issueNumber: json['issue_number']?.toString() ?? 'N/A',
      dateAdded: json['cover_date'] ??
          'Unknown Date', // Ajusta según la estructura correcta
    );
  }
}
