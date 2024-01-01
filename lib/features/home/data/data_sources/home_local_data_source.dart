import 'package:ebook_app/core/utilities/api_service.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  final APIService apiService;

  HomeLocalDataSourceImplementation(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {}

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {}
}
