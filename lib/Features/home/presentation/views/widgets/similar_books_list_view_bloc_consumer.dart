import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/CustomErrorMessage.dart';
import '../../../../../core/widgets/CustomLoadingIndicator.dart';
import '../../manger/similar_books_cubit/similar_books_cubit.dart';
import 'similar_books_list_view.dart';

class SimilarBooksListViewBlocConsumer extends StatelessWidget {
  const SimilarBooksListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SimilarBooksListview(
            books: state.books,
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMassege);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
