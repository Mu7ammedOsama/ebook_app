import 'package:ebook_app/core/utilities/styles.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_details_action_button.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_books_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.3),
          child: const CustomBooksImage(image: 'https://imgupscaler.com/images/samples/animal-after.webp'),
        ),
        const SizedBox(height: 40),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 32),
        const BookDetailsActionButton(),
      ],
    );
  }
}
