// ignore_for_file: sized_box_for_whitespace

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
            onPressed: () {},
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
                return Future.delayed(const Duration(seconds: 2));
              },
              child: Column(
                children: [
                  const SizedBox(height: 16.0),
                  ComicCarouselCard(comics: comics),
                  const SizedBox(height: 16.0),
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_connection.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Failed to load comics. Please check your connection.',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: Container(
        height: 80.0,
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
          onTap: (index) {},
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
