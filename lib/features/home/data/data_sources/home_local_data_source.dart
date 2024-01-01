import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utilities/api_service.dart';
import 'package:ebook_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImplementation extends HomeLocalDataSource {
  final APIService apiService;

  HomeLocalDataSourceImplementation(this.apiService);

  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBooksBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBooksBox);
    return box.values.toList();
  }
}
