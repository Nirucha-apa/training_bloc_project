import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/food/bloc/food_bloc.dart';
import 'package:training_bloc_project/login/bloc/login_bloc.dart';

import 'login/widget/login_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<FoodBloc>(
        create: (BuildContext context) => FoodBloc(),
      ),
    ],
  child: const HomePage(),
)
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FoodBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<FoodBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
        body: const LoginPage(),
      ),
    );
  }
}