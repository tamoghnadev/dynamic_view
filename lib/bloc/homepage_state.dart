part of 'homepage_bloc.dart';

abstract class HomepageState {}

class HomepageLoadingState extends HomepageState {}

class HomepageLoadedState extends HomepageState {
  final List<HomepageComponent> components;
  HomepageLoadedState({required this.components});
}

class HomepageErrorState extends HomepageState {
  final String errorMessage;
  HomepageErrorState({required this.errorMessage});
}