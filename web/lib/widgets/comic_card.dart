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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComicDetailsScreen(comic: comic),
            ),
          );
        },
        child: Row(
          children: [
            SizedBox(
                height: 50, // Ajusta la altura según sea necesario
                width: 80, // Ajusta el ancho según sea necesario
                child: Image.network(
                  comic.imageUrl,
                  fit: BoxFit.cover,
                  height: 150.0,
                  width: 160.0,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) {
                      return child;
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${comic.name} #${comic.issueNumber}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Released: ${comic.dateAdded}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
