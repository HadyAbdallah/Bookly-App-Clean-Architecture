import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_newest_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.newestBooksUseCase) : super(NewestBooksInitial());

  final FetchNewestBooksUseCase newestBooksUseCase;
  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await newestBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        emit(NewestBooksFailure(failure.massege));
      } else {
        emit(NewestBooksPaginationFailure(failure.massege));
      }
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
