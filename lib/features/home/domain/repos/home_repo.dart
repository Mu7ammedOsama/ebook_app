import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
}
