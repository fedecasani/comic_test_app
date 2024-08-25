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
        title: const Text(
          'Comics List',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
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

            return RefreshIndicator(
              onRefresh: () async {
                // No hace nada, es solo visual
                return Future.delayed(const Duration(seconds: 2));
              },
              child: Column(
                children: [
                  const SizedBox(height: 16.0), // Espacio antes del carrusel
                  // Carrusel de cómics
                  ComicCarouselCard(comics: comics),
                  const SizedBox(
                      height: 16.0), // Espacio entre el carrusel y la lista
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
              ),
            );
          } else if (state is ComicListError) {
            return const Center(child: Text('Failed to load comics'));
          }
          return Container(); // Devolver un widget vacío si el estado no coincide
        },
      ),
      bottomNavigationBar: Container(
        height: 80.0, // Ajusta la altura según sea necesario
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            // No hay acción al seleccionar un ítem
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
