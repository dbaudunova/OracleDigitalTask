import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';
import 'package:oracle_digital_task/presentation/provider/city_provider.dart';
import 'package:oracle_digital_task/presentation/widgets/city_item.dart';
import 'package:oracle_digital_task/core/constants/dimens.dart';
import 'package:oracle_digital_task/core/constants/strings.dart';

class CitiesScreen extends HookConsumerWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchQuery = useState<String?>(null);

    final getCities = ref.watch(cityListProvider(searchQuery.value));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.d8),
              child: _buildTextField(searchController, searchQuery),
            ),
            Expanded(
              child: getCities.when(
                data: (cities) {
                  return _buildListView(cities);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Text(
                    'Error: $error',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildListView(List<CityEntity> cities) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(Dimens.d8),
          child: CityItem(cityEntity: cities[index]),
        );
      },
    );
  }

  TextField _buildTextField(
    TextEditingController searchController,
    ValueNotifier<String?> searchQuery,
  ) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: AppStrings.search,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.d8),
        ),
      ),
      onChanged: (value) {
        searchQuery.value = value.isEmpty ? null : value;
      },
    );
  }
}
