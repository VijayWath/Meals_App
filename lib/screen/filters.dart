import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(children: [
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
          subtitle: Text(
            'Only include Gluten free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          value: activeFilter[Filter.glutenFree]!,
          title: Text(
            'Gluten free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
          subtitle: Text(
            'Only include Lactose free meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          value: activeFilter[Filter.lactoseFree]!,
          title: Text(
            'Lactose free',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegiterian, isChecked);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
          subtitle: Text(
            'Only include vegiterian meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          value: activeFilter[Filter.vegiterian]!,
          title: Text(
            'vegiterian only',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
        SwitchListTile(
          onChanged: (isChecked) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
          },
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 34, right: 22),
          subtitle: Text(
            'Only include vegan meals',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          value: activeFilter[Filter.vegan]!,
          title: Text(
            'vegan',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        )
      ]),
    );
  }
}
