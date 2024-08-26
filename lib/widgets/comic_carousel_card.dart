// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../data/models/comic_model.dart';
import '../screens/comic_details_screen.dart'; // Importa la pantalla de detalles

class ComicCarouselCard extends StatelessWidget {
  final List<Comic> comics;

  const ComicCarouselCard({super.key, required this.comics});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, // Altura del carrusel
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: comics.length,
        itemBuilder: (context, index) {
          final comic = comics[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 4.0), // Espacio reducido entre tarjetas
            child: Container(
              width: 160.0, // Ancho fijo para todas las tarjetas
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComicDetailsScreen(comic: comic),
                    ),
                  );
                },
                child: Card(
                  elevation: 5.0, // Sombra de la tarjeta
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Bordes redondeados
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(
                                12.0)), // Bordes redondeados en la parte superior
                        child: Image.network(
                          comic.imageUrl,
                          fit: BoxFit.cover,
                          height: 150.0, // Altura fija para la imagen
                          width: 160.0, // Ancho fijo para la imagen
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Título
                            Text(
                              '${comic.name} #${comic.issueNumber}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                              overflow: TextOverflow
                                  .ellipsis, // Trunca el texto si es muy largo
                            ),
                            // Fecha
                            Text(
                              'Released: ${comic.dateAdded}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 14.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
