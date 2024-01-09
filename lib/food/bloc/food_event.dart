import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable{
  const FoodEvent();
}

class FetchDataEvent extends FoodEvent {
  @override
  List<Object?> get props => [];
}