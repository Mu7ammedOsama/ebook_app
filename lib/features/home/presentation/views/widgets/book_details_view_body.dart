import 'package:ebook_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SafeArea(
                  child: CustomBookDetailsAppBar(),
                ),
                BookDetailsSection(),
                Expanded(
                  child: SizedBox(height: 40),
                ),
                SimilarBooksSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
