import 'package:bookly_clear_arch/Features/search/presentation/manger/search_for_books_cubit/search_for_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/CustomLoadingIndicator.dart';
import '../../../../home/domain/entities/book_entity.dart';
import 'search_result_list_view.dart';

class SearchBooksListViewBlocConsumer extends StatefulWidget {
  const SearchBooksListViewBlocConsumer({super.key});

  @override
  State<SearchBooksListViewBlocConsumer> createState() =>
      _SearchBooksListViewBlocConsumerState();
}

class _SearchBooksListViewBlocConsumerState
    extends State<SearchBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchForBooksCubit, SearchForBooksState>(
      listener: (context, state) {
        if (state is SearchForBooksPaginationSuccess) {
          books.addAll(state.books);
        }
        if (state is SearchForBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
        if (state is SearchForBooksSuccess) {
          books = state.books;
        }
      },
      builder: (context, state) {
        if (state is SearchForBooksSuccess ||
            state is SearchForBooksPaginationLoading ||
            state is SearchForBooksPaginationFailure ||
            state is SearchForBooksPaginationSuccess) {
          return SearchResultListView(books: books);
        } else if (state is SearchForBooksFailure) {
          return const Center(
            child: Text(
              'There are no matching books, Please search again.',
              textAlign: TextAlign.center,
              style: Styles.textStyle20,
            ),
          );
        } else if (state is SearchForBooksLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              'Search for books.',
              textAlign: TextAlign.center,
              style: Styles.textStyle20,
            ),
          );
        }
      },
    );
  }
}
