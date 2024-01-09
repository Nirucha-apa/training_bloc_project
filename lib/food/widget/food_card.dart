import 'package:flutter/material.dart';

import 'food.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key,required this.food});

  final Food food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: Image.network(
                food.thumbnailURL,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Text(
                              food.price,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 0,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}