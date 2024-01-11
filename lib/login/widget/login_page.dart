import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/login/bloc/login_bloc.dart';

import 'login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = context.read<LoginBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("LOGIN")),
        body: LoginForm(
        loginBloc : _loginBloc,
      ),
      );
  }

}
