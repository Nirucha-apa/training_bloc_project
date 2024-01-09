import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/home/home_event.dart';
import 'package:training_bloc_project/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(const HomeInitialState()){}

}