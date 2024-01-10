import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();
}

class LoginInitialState extends LoginState{
  const LoginInitialState();

  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState{
  const LoginLoadingState();

  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState{
  final String username;

  const LoginSuccessState({
    required this.username
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() => 'Hi!! $username'; 
}

class LoginErrorState extends LoginState{
  final String errorMessage;
  const LoginErrorState({
    required this.errorMessage
  });

  @override
  List<Object?> get props => [];
}