import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/login/bloc/login_event.dart';
import 'package:training_bloc_project/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc(): super(const LoginInitialState()){
    on<LoginPsaawordEvent>(_onLogin);
  }

  void _onLogin(LoginPsaawordEvent event,Emitter<LoginState> emit) async{
    emit(const LoginLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    
    if(event.username.isNotEmpty && event.password.isNotEmpty){
      emit(LoginSuccessState(username: event.username));
    }
    else{
      emit(const LoginErrorState(errorMessage: 'something went very wrong!!'));
    }
  }
}