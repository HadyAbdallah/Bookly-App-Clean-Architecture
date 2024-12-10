part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  SimilarBooksSuccess(this.books);
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errMassege;

  SimilarBooksFailure(this.errMassege);
}
