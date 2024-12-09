import 'package:bookly_clear_arch/Features/home/presentation/views/widgets/newest_books_list_view_bloc_consumer.dart';
import 'package:bookly_clear_arch/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'newest_books_list_view.dart';
import 'custom_app_bar.dart';
import 'featured_books_list_view_bloc_consumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListViewBlocConsumer(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        NewestBooksListViewBlocConsumer(),
      ],
    );
  }
}
