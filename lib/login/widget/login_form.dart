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
                decoration: const InputDecoration(
                  labelText: 'username',
                  prefixIcon: Icon(Icons.account_circle)
                  ),
                controller: _usernameController,
              ),
              TextFormField(
                decoration:const InputDecoration(
                  labelText: 'password',
                  prefixIcon: Icon(Icons.lock)),
                controller: _passwordController,
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 18),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,),
                  onPressed: () {
                    print(state);
                    _onLoginButtonPressed();
                    print(LoginSuccessState(username: _usernameController.text).toString());
                    context.goNamed("food",pathParameters: {"username": _usernameController.text});
                    
                    if(state is LoginLoadingState){
                      const CircularProgressIndicator();                  
                    }
                    if(state is LoginErrorState)
                    {
                      Text(state.errorMessage);
                    }
                  }),
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