part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {

}

final class FactsSuccessState extends HomePageState{
 final List<String>facts;

  FactsSuccessState({required this.facts});
}

final class FactsLoadingState extends HomePageState{

}
