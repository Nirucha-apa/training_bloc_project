import 'package:equatable/equatable.dart';

import '../widget/food.dart';

abstract class FoodState extends Equatable{
  const FoodState();
}

class FoodInitialState extends FoodState{
  const FoodInitialState();

  @override
  List<Object?> get props => [];
}

class FoodLoadingState extends FoodState{
  const FoodLoadingState();
  
  @override
  List<Object?> get props => [];
}

class FoodErrorFetchDataState extends FoodState{
  final String errorMessage;
  const FoodErrorFetchDataState({
    required this.errorMessage
  });

  @override
  List<Object?> get props => [];
}

class FoodSuccessFetchDataState extends FoodState {
  final List<Food> foods;
  const FoodSuccessFetchDataState({
    required this.foods,
  });

  @override
  List<Object?> get props => [];
}