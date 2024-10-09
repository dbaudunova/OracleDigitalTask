import 'package:flutter/material.dart';
import 'package:oracle_digital_task/core/constants/dimens.dart';
import 'package:oracle_digital_task/core/constants/styles.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
    this.cityEntity,
  });

  final CityEntity? cityEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.d8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(Dimens.d8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cityEntity?.name ?? 'No name',
            style: Styles.s20w300,
          ),
          Text(
            cityEntity?.slug ?? 'No slug',
            style: Styles.s20w300.copyWith(
              fontSize: Dimens.d16,
            ),
          ),
        ],
      ),
    );
  }
}
