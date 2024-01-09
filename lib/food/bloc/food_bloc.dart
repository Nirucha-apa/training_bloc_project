import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/food/bloc/food_event.dart';
import 'package:training_bloc_project/food/bloc/food_state.dart';
import 'package:training_bloc_project/food/widget/food_generator.dart';

import '../widget/food.dart';

class FoodBloc extends Bloc<FoodEvent,FoodState>{
  FoodBloc() : super(const FoodInitialState()){
    on<FetchDataEvent>(_onFetchDataEvent);
  }

  void _onFetchDataEvent(FetchDataEvent event,Emitter<FoodState> emitter) async{
    emitter(const FoodLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    bool isSucceed = Random().nextBool();

    if(isSucceed){
      List<Food> _dummyFoods = FoodGenerator.generateDummyFoods();
      emitter(FoodSuccessFetchDataState(foods: _dummyFoods));
    }
    else{
      emitter(const FoodErrorFetchDataState(errorMessage: "something went very wrong :(" ));
    }
  }
}