import 'package:dio/dio.dart';
import 'package:ebook_app/core/utilities/api_service.dart';
import 'package:ebook_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(
    APIService(Dio()),
  );

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getIt.get<APIService>()),
  );
}
