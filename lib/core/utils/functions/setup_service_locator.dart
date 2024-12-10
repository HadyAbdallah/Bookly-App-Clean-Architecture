import 'package:bookly_clear_arch/Features/home/data/data_source/home_local_data_source_impl.dart';
import 'package:bookly_clear_arch/Features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:bookly_clear_arch/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clear_arch/Features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:bookly_clear_arch/Features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../api_service.dart';

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      ),
    ),
  );
}

final getIt = GetIt.instance;
