import 'package:equatable/equatable.dart';


abstract class HomeState extends Equatable{
  const HomeState();
}

class HomeInitialState extends HomeState{
  const HomeInitialState();

  @override
  List<Object?> get props => [];
}

