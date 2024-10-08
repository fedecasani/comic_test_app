// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../data/models/comic_model.dart';
import '../data/repositories/comic_repository.dart';

part 'comic_list_event.dart';
part 'comic_list_state.dart';

class ComicListBloc extends Bloc<ComicListEvent, ComicListState> {
  final ComicRepository comicRepository;

  ComicListBloc({required this.comicRepository}) : super(ComicListLoading()) {
    on<LoadComics>(_onLoadComics);
  }

  void _onLoadComics(LoadComics event, Emitter<ComicListState> emit) async {
    emit(ComicListLoading());
    try {
      final box = Hive.box<Comic>('comicsBox');
      List<Comic> comics;

      if (box.isEmpty) {
        comics = await comicRepository.fetchComics();
        for (var comic in comics) {
          await box.add(comic);
        }
      } else {
        comics = box.values.toList();
      }

      comics.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      emit(ComicListLoaded(comics: comics));
    } catch (e) {
      print("Error loading comics: $e");
      emit(const ComicListError());
    }
  }
}
