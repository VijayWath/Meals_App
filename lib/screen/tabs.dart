import 'package:flutter/material.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/screen/filters.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegiterian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'fillters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMeals);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Category';

    if (selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: setScreen),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
