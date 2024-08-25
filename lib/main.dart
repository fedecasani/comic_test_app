import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/comic_list_bloc.dart';
import 'data/repositories/comic_repository.dart';
import 'screens/comic_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ComicListBloc(comicRepository: ComicRepository())
          ..add(LoadComics()),
        child: const ComicListScreen(),
      ),
    );
  }
}
