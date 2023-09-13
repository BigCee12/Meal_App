import 'package:flutter/material.dart';
import 'package:meals/widgets/switch_tile.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          CustomSwitchTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (ischecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, ischecked);
              },
              title: "Gluten-Free",
              subtitle: "Only include Gluten-free meals"),
          CustomSwitchTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (ischecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, ischecked);
              },
              title: "Lactose-Free",
              subtitle: "Only include Lactose-free meals"),
          CustomSwitchTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (ischecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, ischecked);
              },
              title: "Vegetarian-Free",
              subtitle: "Only include Vegetarian-free meals"),
          CustomSwitchTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (ischecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, ischecked);
              },
              title: "Vegan-Free",
              subtitle: "Only include Vegan-free meals"),
        ],
      ),
    );
  }
}
