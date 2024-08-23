import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      final comics = await comicRepository.fetchComics();
      emit(ComicListLoaded(comics: comics));
    } catch (e) {
      print("Error loading comics: $e");
      emit(ComicListError());
    }
  }
}
