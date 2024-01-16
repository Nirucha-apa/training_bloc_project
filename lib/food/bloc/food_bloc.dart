import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/food/bloc/food_event.dart';
import 'package:training_bloc_project/food/bloc/food_state.dart';
import 'package:training_bloc_project/food/widget/food_generator.dart';

import '../widget/food.dart';

class FoodBloc extends Bloc<FoodEvent,FoodState>{
  FoodBloc() : super(const FoodInitialState()){
    on<FetchDataEvent>(_onFetchDataEvent);
    on<AddFoodEvent>(_onAddFoodEvent);
  }

  void _onFetchDataEvent(FetchDataEvent event,Emitter<FoodState> emitter) async{
    emitter(const FoodLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    int isSucceed = Random().nextInt(5);

    if(isSucceed > 0){
      List<Food> _dummyFoods = FoodGenerator.generateDummyFoods();
      emitter(FoodSuccessFetchDataState(foods: _dummyFoods));
    }
    else{
      emitter(const FoodErrorFetchDataState(errorMessage: "something went very wrong :(" ));
    }
  }

  void _onAddFoodEvent(AddFoodEvent event,Emitter<FoodState> emitter) async{
    emitter(const FoodLoadingState());
    await Future.delayed(const Duration(seconds: 2));

    if(event.item > 0){
      int items = event.item + 1;
      emitter(AddFoodState(item: items));
    }
    else{
      emitter(const FoodErrorFetchDataState(errorMessage: "something went very wrong :(" ));
    }
  }
}