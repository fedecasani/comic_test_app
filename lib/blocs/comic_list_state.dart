part of 'comic_list_bloc.dart';

abstract class ComicListState extends Equatable {
  const ComicListState();

  @override
  List<Object> get props => [];
}

class ComicListLoading extends ComicListState {}

class ComicListLoaded extends ComicListState {
  final List<Comic> comics;

  const ComicListLoaded({required this.comics});

  @override
  List<Object> get props => [comics];
}

class ComicListError extends ComicListState {}
