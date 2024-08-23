import 'package:flutter/material.dart';
import '../data/models/comic_model.dart';

class ComicCard extends StatelessWidget {
  final Comic comic;

  const ComicCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          comic.imageUrl,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons
                .broken_image); // Mostrar un icono por defecto si la imagen falla
          },
        ),
        title: Text('${comic.name} #${comic.issueNumber}'),
        subtitle: Text('Released: ${comic.dateAdded}'),
      ),
    );
  }
}
