import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBooksImage extends StatelessWidget {
  const CustomBooksImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
        ),
      ),
    );
  }
}
