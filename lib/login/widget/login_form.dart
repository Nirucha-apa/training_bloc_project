import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:training_bloc_project/login/bloc/login_bloc.dart';
import 'package:training_bloc_project/login/bloc/login_event.dart';
import 'package:training_bloc_project/login/bloc/login_state.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  const LoginForm({
    Key? key,
    required this.loginBloc});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      bloc: _loginBloc,
      builder: ((context, state) {
        if(state is LoginErrorState){
          return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                  ],
                ),
              );
        }

        return Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: _usernameController,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    if(state is LoginLoadingState){
                      const CircularProgressIndicator();                  
                    }
                    else{
                        _onLoginButtonPressed();
                      if(state is LoginSuccessState){
                        print(LoginSuccessState(username: _usernameController.text).toString());
                        context.goNamed("food",pathParameters: {"username": _usernameController.text});
                      }
                    }
                  }),
              ),
              Container(
                child:
                    state is LoginLoadingState ? const CircularProgressIndicator() : null,
              ),
            ],
          )
        );
      })
      );
  }

  _onLoginButtonPressed() {
    _loginBloc.add(LoginPsaawordEvent(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}