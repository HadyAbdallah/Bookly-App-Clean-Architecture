import 'package:bookly_clear_arch/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly_clear_arch/core/widgets/CustomLoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/CustomErrorMessage.dart';
import '../../../domain/entities/book_entity.dart';
import '../../manger/newest_books_cubit/newest_books_cubit.dart';

class NewestBooksListViewBlocConsumer extends StatefulWidget {
  const NewestBooksListViewBlocConsumer({super.key});

  @override
  State<NewestBooksListViewBlocConsumer> createState() =>
      _NewestBooksListViewBlocConsumerState();
}

class _NewestBooksListViewBlocConsumerState
    extends State<NewestBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationFailure) {
          return NewestBooksListView(books: books);
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorMessage(errMessage: state.errMessage));
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
