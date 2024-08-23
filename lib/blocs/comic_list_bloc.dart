import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/comic_model.dart';
import '../data/repositories/comic_repository.dart';

part 'comic_list_event.dart';
part 'comic_list_state.dart';

class ComicListBloc extends Bloc<ComicListEvent, ComicListState> {
  final ComicRepository comicRepository;

  ComicListBloc({required this.comicRepository}) : super(ComicListLoading());

  // Eliminado @override
  Stream<ComicListState> mapEventToState(ComicListEvent event) async* {
    if (event is LoadComics) {
      yield ComicListLoading();
      try {
        final comics = await comicRepository.fetchComics();
        yield ComicListLoaded(comics: comics);
      } catch (_) {
        yield ComicListError();
      }
    }
  }
}
