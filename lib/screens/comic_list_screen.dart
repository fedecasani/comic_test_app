import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comic_list_bloc.dart';
import '../widgets/comic_card.dart';
import '../widgets/comic_carousel_card.dart';

class ComicListScreen extends StatelessWidget {
  const ComicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 4.0,
        title: Text(
          'Comics List',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Aquí puedes agregar la acción para el botón de búsqueda
            },
          ),
        ],
      ),
      body: BlocBuilder<ComicListBloc, ComicListState>(
        builder: (context, state) {
          if (state is ComicListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComicListLoaded) {
            final comics = state.comics;

            return Column(
              children: [
                SizedBox(height: 16.0), // Espacio antes del carrusel
                // Carrusel de cómics
                ComicCarouselCard(comics: comics),
                SizedBox(height: 16.0), // Espacio entre el carrusel y la lista
                // Lista de cómics
                Expanded(
                  child: ListView.builder(
                    itemCount: comics.length,
                    itemBuilder: (context, index) {
                      final comic = comics[index];
                      return ComicCard(comic: comic);
                    },
                  ),
                ),
              ],
            );
          } else if (state is ComicListError) {
            return const Center(child: Text('Failed to load comics'));
          }
          return Container(); // Devolver un widget vacío si el estado no coincide
        },
      ),
    );
  }
}
