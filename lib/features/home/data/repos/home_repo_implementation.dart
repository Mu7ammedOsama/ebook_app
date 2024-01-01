// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:ebook_app/core/errors/failures.dart';
// import 'package:ebook_app/core/utilities/api_service.dart';
// import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
// import 'package:ebook_app/features/home/domain/repos/home_repo.dart';
//
// class HomeRepoImplementation implements HomeRepo {
//   final APIService apiService;
//
//   HomeRepoImplementation(this.apiService);
//
//   @override
//   Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
//     try {
//       var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
//
//       List<BookModel> books = [];
//
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailures.fromDioError(e));
//       }
//       return left(ServerFailures(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=subject=Computer Science');
//
//       List<BookModel> books = [];
//
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailures.fromDioError(e));
//       }
//       return left(ServerFailures(e.toString()));
//     }
//   }
//
//   @override
//   Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category}) async {
//     try {
//       var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject=Computer Science');
//
//       List<BookModel> books = [];
//
//       for (var item in data['items']) {
//         books.add(BookModel.fromJson(item));
//       }
//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailures.fromDioError(e));
//       }
//       return left(ServerFailures(e.toString()));
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:ebook_app/core/errors/failures.dart';
import 'package:ebook_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:ebook_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:ebook_app/features/home/domain/repos/home_repo.dart';

class HomeRepoImplementation extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;

      books = homeLocalDataSource.fetchFeaturedBooks();

      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failures());
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;

      books = homeLocalDataSource.fetchNewestBooks();

      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      return left(Failures());
    }
  }
}
