import 'package:ebook_app/core/utilities/assets_data.dart';
import 'package:flutter/material.dart';

class CustomBooksImage extends StatelessWidget {
  const CustomBooksImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsData.logo),
          ),
        ),
      ),
    );
  }
}
