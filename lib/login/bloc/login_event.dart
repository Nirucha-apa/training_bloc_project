import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();
}

class LoginPsaawordEvent extends LoginEvent{
  final String username;
  final String password;

  const LoginPsaawordEvent({
    required this.username,
    required this.password
  });

  @override
  List<Object> get props => [username,password];

  @override
  String toString() => 'username: {$username} , password: {$password}';
}

class LogOutEvent extends LoginEvent{
  @override
  List<Object?> get props => [];
}