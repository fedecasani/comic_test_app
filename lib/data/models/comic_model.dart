class Comic {
  final String name;
  final String imageUrl;
  final String issueNumber;
  final String dateAdded;

  Comic(
      {required this.name,
      required this.imageUrl,
      required this.issueNumber,
      required this.dateAdded});

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      name: json['name'],
      imageUrl: json['image']['url'],
      issueNumber: json['issue_number'],
      dateAdded: json['date_added'],
    );
  }
}
