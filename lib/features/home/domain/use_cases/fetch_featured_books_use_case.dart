import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:ebook_app/features/home/domain/repos/home_repo.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() {
    return homeRepo.fetchFeaturedBooks();
  }
}
