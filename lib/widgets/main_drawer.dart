import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen, super.key});
  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'cooking up!',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  onSelectScreen('meals');
                },
                leading: Icon(
                  Icons.restaurant,
                  size: 26,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                title: Text(
                  'Meals',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24),
                ),
              ),
              ListTile(
                onTap: () {
                  onSelectScreen('fillters');
                },
                leading: Icon(
                  Icons.settings,
                  size: 26,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                title: Text(
                  'Fillters',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
