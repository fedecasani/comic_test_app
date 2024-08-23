part of 'comic_list_bloc.dart';

abstract class ComicListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadComics extends ComicListEvent {}
