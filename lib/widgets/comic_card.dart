import 'package:flutter/material.dart';
import '../data/models/comic_model.dart';
import '../screens/comic_details_screen.dart'; // Importa la pantalla de detalles

class ComicCard extends StatelessWidget {
  final Comic comic;

  const ComicCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        // Usa InkWell para que el Card sea tocable
        onTap: () {
          // Navega a ComicDetailsScreen al hacer clic
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComicDetailsScreen(comic: comic),
            ),
          );
        },
        child: ListTile(
          leading: Image.network(comic.imageUrl),
          title: Text('${comic.name} #${comic.issueNumber}'),
          subtitle: Text('Released: ${comic.dateAdded}'),
        ),
      ),
    );
  }
}
