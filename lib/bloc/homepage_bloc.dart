// homepage_bloc.dart
import 'package:assignment/api/api_service.dart';
import 'package:assignment/data/data_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final ApiService _apiService;

  HomepageBloc(this._apiService) : super(HomepageLoadingState()) {
    on<LoadHomepageEvent>((event, emit) async {
      emit(HomepageLoadingState());
      print("HomepageBloc: LoadHomepageEvent started"); // ADDED: Check event start
      try {
        final response = await _apiService.getHomepageData();
        print("HomepageBloc: API Response Status Code: ${response.statusCode}"); // ADDED: Check status code

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = response.data;
          print("HomepageBloc: API Response Data: $responseData"); // ADDED: Print full response data

          final List<dynamic> viewTypeListJson = responseData['ViewtypeList'];
          print("HomepageBloc: ViewtypeList JSON: $viewTypeListJson"); // ADDED: Check ViewtypeList

          List<HomepageComponent> components = (viewTypeListJson as List)
              .map((json) => HomepageComponent.fromJson(json as Map<String, dynamic>))
              .toList();

          print("HomepageBloc: Parsed Components Count: ${components.length}"); // ADDED: Check component count
          emit(HomepageLoadedState(components: components));
        } else {
          emit(HomepageErrorState(
              errorMessage: 'Failed to load homepage data. Status code: ${response.statusCode}'));
        }
      } catch (e) {
        print("HomepageBloc: Error fetching data: $e"); // ADDED: Catch and print errors
        emit(HomepageErrorState(errorMessage: e.toString()));
      }
    });
  }
}