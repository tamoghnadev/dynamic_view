import 'package:assignment/api/api_service.dart';
import 'package:assignment/bloc/homepage_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ApiService());
  locator.registerFactory(() => HomepageBloc(locator<ApiService>()));
}