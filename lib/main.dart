import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_bloc_project/food/bloc/food_bloc.dart';
import 'package:training_bloc_project/login/bloc/login_bloc.dart';

import 'login/widget/login_page.dart';

// import 'food/bloc/food_event.dart';
// import 'food/bloc/food_state.dart';
// import 'food/widget/food_card.dart';

void main() {
  runApp(
    // BlocProvider(
    //   create: (context) => FoodBloc(),
    //   child: const HomeSreen(),
    // ),
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
        appBar: AppBar(title: const Text("Cool App")),
        body: const LoginPage(),
        // body: BlocConsumer<FoodBloc, FoodState>(
        //   listener: (context, state) {
        //   },
        //   builder: (context, state) {
        //     if (state is FoodLoadingState) {
        //       return const CircularProgressIndicator();
        //     }
        //     if (state is FoodSuccessFetchDataState) {
        //       return Center(
        //         child: ListView.builder(
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) {
        //             return FoodCard(food: state.foods[index],);
        //           },
        //           itemCount: state.foods.length,
        //         ),
        //       );
        //     }
        //     if (state is FoodErrorFetchDataState) {
        //       return Center(
        //         child: Column(
        //           children: [
        //             Text(state.errorMessage),
        //             ElevatedButton(
        //               child: const Text("Fetch Data"),
        //               onPressed: () {
        //                 bloc.add(FetchDataEvent());
        //               },
        //             ),
        //           ],
        //         ),
        //       );
        //       }

        //     return Center(
        //       child: ElevatedButton(
        //         child: const Text("Fetch Data"),
        //         onPressed: () {
        //           bloc.add(FetchDataEvent());
        //         },
        //       ),
        //     );
        //   },
        // ),
      ),
    );
  }
}