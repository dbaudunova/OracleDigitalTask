import 'package:flutter/material.dart';
import 'package:oracle_digital_task/presentation/widgets/city_item.dart';
import 'package:oracle_digital_task/core/constants/dimens.dart';
import 'package:oracle_digital_task/core/constants/strings.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.d8),
            child: _buildSearchTextField(),
          ),
          Expanded(
            child: _buildCitiesListView(),
          ),
        ],
      ),
    );
  }

  TextField _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: AppStrings.search,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimens.d8),
        ),
      ),
      onChanged: (value) {},
    );
  }

  ListView _buildCitiesListView() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(Dimens.d8),
          child: CityItem(),
        );
      },
    );
  }
}
