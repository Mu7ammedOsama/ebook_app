import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/core/use_cases/no_param.dart';
import 'package:ebook_app/core/use_cases/use_case.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:ebook_app/features/home/domain/repos/home_repo.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failures, List<BookEntity>>> call([NoParam? param]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
