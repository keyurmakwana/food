import 'package:flutter/material.dart';
import 'package:food/models/meal.dart';
import 'package:food/widgets/meal_screen_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoriteMeal;

  Favorite(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    return favoriteMeal.isEmpty ? Center(
      child: Text('You have no favorite'),
    ): ListView.builder(
      itemBuilder: (ctx, index) {
        return MealScreenItem(
          id: favoriteMeal[index].id,
          title: favoriteMeal[index].title,
          imageUrl: favoriteMeal[index].imageUrl,
          duration: favoriteMeal[index].duration,
          affordability: favoriteMeal[index].affordability,
          complexity: favoriteMeal[index].complexity,
        );
      },
      itemCount: favoriteMeal.length,
    );
  }
}
