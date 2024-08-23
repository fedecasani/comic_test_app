import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/comic_list_bloc.dart';
import '../widgets/comic_card.dart';

class ComicListScreen extends StatelessWidget {
  const ComicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comics List'),
      ),
      body: BlocBuilder<ComicListBloc, ComicListState>(
        builder: (context, state) {
          if (state is ComicListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ComicListLoaded) {
            return ListView.builder(
              itemCount: state.comics.length,
              itemBuilder: (context, index) {
                final comic = state.comics[index];
                return ComicCard(comic: comic);
              },
            );
          } else if (state is ComicListError) {
            return const Center(child: Text('Failed to load comics'));
          }
          return Container();
        },
      ),
    );
  }
}
