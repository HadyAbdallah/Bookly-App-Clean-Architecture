part of 'search_for_books_cubit.dart';

@immutable
abstract class SearchForBooksState {}

class SearchForBooksInitial extends SearchForBooksState {}

class SearchForBooksPaginationLoading extends SearchForBooksInitial {}

class SearchForBooksPaginationSuccess extends SearchForBooksInitial {
  final List<BookEntity> books;

  SearchForBooksPaginationSuccess(this.books);
}

class SearchForBooksPaginationFailure extends SearchForBooksInitial {
  final String errMessage;

  SearchForBooksPaginationFailure(this.errMessage);
}

class SearchForBooksLoading extends SearchForBooksInitial {}

class SearchForBooksSuccess extends SearchForBooksInitial {
  final List<BookEntity> books;

  SearchForBooksSuccess(this.books);
}

class SearchForBooksFailure extends SearchForBooksInitial {
  final String errMessage;

  SearchForBooksFailure(this.errMessage);
}
