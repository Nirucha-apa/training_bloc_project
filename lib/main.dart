import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'food/food_card.dart';
import 'home/home_bloc.dart';
import 'home/home_event.dart';
import 'home/home_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeSreen(),
    ),
  );
}

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Cool App")),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is HomeSuccessFetchDataState) {
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
            if (state is HomeErrorFetchDataState) {return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(
                      child: const Text("Fetch Data"),
                      onPressed: () {
                        bloc.add(FetchDataEvent());
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
                  bloc.add(FetchDataEvent());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}