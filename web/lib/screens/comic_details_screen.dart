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
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(comic.imageUrl),
              const SizedBox(height: 16),
              Text(
                comic.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Released: ${comic.dateAdded}',
                style:
                    const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Description: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Creators: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.creators.join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Characters: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.characters.join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Teams: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.teams.join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Locations: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.locations.join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Concepts: ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue[900], // Color para la etiqueta
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: comic.concepts.join(', '),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Color para el contenido
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
