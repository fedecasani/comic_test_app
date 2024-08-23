import 'package:flutter/material.dart';
import '../data/models/comic_model.dart';

class ComicDetailsScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailsScreen({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
        title: Text(
          '${comic.name} #${comic.issueNumber}',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Aquí puedes agregar la acción para el botón de búsqueda
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(comic.imageUrl),
            const SizedBox(height: 16),
            Text(
              comic.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Released: ${comic.dateAdded}',
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            // Agrega más detalles del cómic aquí según lo que recibas de la API
          ],
        ),
      ),
    );
  }
}
