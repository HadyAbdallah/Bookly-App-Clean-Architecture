import 'package:bloc/bloc.dart';

import '../../../domain/entities/book_entity.dart';
import '../../../domain/repos/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failuer) {
      emit(SimilarBooksFailure(failuer.massege));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
