import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({required this.meals, this.title, super.key});

  final String? title;
  final List<Meal> meals;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No data',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try Diffrent Category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )
        ],
      ),
    );

    // print(meals.length);
    // print(meals[3].title);
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          onSelectMeal: (meal) {
            selectMeal(meal, context);
          },
          meal: meals[index],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
