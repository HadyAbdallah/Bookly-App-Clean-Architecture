import 'package:bloc/bloc.dart';
import 'package:bookly_clear_arch/Features/search/domain/use_cases/search_for_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../home/domain/entities/book_entity.dart';

part 'search_for_books_state.dart';

class SearchForBooksCubit extends Cubit<SearchForBooksState> {
  SearchForBooksCubit(this.searchForBooksUseCase)
      : super(SearchForBooksInitial());
  final SearchForBooksUseCase searchForBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0, required String q}) async {
    if (pageNumber == 0) {
      emit(SearchForBooksLoading());
    } else {
      emit(SearchForBooksPaginationLoading());
    }
    var result = await searchForBooksUseCase.call(pageNumber, q);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(SearchForBooksFailure(failure.massege));
      } else {
        emit(SearchForBooksPaginationFailure(failure.massege));
      }
    }, (books) {
      emit(SearchForBooksSuccess(books));
    });
  }
}
