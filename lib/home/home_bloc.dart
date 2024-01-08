import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/home/home_event.dart';
import 'package:training_bloc_project/home/home_state.dart';

import '../food/food.dart';
import '../food/food_generator.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(const HomeInitialState()){
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(FetchDataEvent event,
  Emitter<HomeState> emitter) async{
    emitter(const HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    bool isSucceed = Random().nextBool();
    if (isSucceed) {
      List<Food> _dummyFoods = FoodGenerator.generateDummyFoods();
      emitter(HomeSuccessFetchDataState(foods: _dummyFoods));
    } else {
      emitter(const HomeErrorFetchDataState(
        errorMessage: "something went very wrong :(",
      ));
    }
  }
}