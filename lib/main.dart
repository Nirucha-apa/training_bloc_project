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
  child: const HomeSreen(),
)
  );
}

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
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
        appBar: AppBar(title: const Text("LOGIN")),
        body: const LoginPage(),
      ),
    );
  }
}