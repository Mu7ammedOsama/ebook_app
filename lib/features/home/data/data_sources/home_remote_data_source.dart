import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utilities/api_service.dart';
import 'package:ebook_app/core/utilities/functions/save_books.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final APIService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=Programming');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBooksBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=Programming');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kNewestBooksBox);

    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
