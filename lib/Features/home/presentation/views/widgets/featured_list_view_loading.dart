import 'package:bookly_clear_arch/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'custom_book_item_loading.dart';

class FeaturedListViewLoading extends StatelessWidget {
  const FeaturedListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookItemLoading(),
              );
            }),
      ),
    );
  }
}
