import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cats_app/pages/Home/repo/datafetchrepo.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageInitialFetchEvent>(homePageInitialFetchEvent);
 
  }

  Future<void> homePageInitialFetchEvent(HomePageInitialFetchEvent event, Emitter<HomePageState> emit) async {
    emit(FactsLoadingState());
    var fatcs=await Datafetchrepo.fetchDataMethod();
    emit(FactsSuccessState(facts:fatcs as List<String>));

  }
}
