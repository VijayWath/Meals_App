import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegiterian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegiterian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosednFilters) {
    state = chosednFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
        (ref) => FilterNotifier());

final filteredMeals = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilter = ref.watch(filtersProvider);
  return meals.where(
    (meal) {
      if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilter[Filter.vegiterian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    },
  ).toList();
});
