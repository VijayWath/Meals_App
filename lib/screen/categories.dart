import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({required this.availableMeals, super.key});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void selectCategory(BuildContext context, Category category) {
    final fillteredMeals = widget.availableMeals
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: fillteredMeals,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        child: GridView(
          padding: EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                onSelectCategory: () {
                  selectCategory(context, category);
                },
                category: category,
              )
          ],
        ),
        animation: animationController,
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: Offset(0, 0.3),
                end: Offset(0, 0),
              ).animate(
                CurvedAnimation(
                    parent: animationController, curve: Curves.easeInOut),
              ),
              child: child,
            ));
  }
}
