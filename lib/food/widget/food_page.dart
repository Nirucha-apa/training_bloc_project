import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/food/bloc/food_bloc.dart';

import '../bloc/food_event.dart';
import '../bloc/food_state.dart';
import 'food_card.dart';

class FoodPage extends StatefulWidget {
  final String username;

  const FoodPage({Key? key, required this.username}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  late FoodBloc foodBloc;
  String get _username  => widget.username;

  @override
  void initState() {
    super.initState();
    foodBloc = context.read<FoodBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi!! ${_username}'),
        backgroundColor: Colors.orange,),
      body: BlocConsumer<FoodBloc, FoodState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is FoodLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is FoodSuccessFetchDataState) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return FoodCard(food: state.foods[index],);
                  },
                  itemCount: state.foods.length,
                ),
              );
            }
            if (state is FoodErrorFetchDataState) {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      child: const Text("Fetch Data"),
                      onPressed: () {
                        foodBloc.add(FetchDataEvent());
                      },
                    ),
                  ],
                ),
              );
              }
            return Center(
              child: ElevatedButton(
                child: const Text("Fetch Data"),
                onPressed: () {
                  foodBloc.add(FetchDataEvent());
                },
              ),
            );
          },
        ),
    );
  }
}