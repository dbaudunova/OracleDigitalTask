import 'package:flutter/material.dart';
import 'package:oracle_digital_task/core/constants/dimens.dart';
import 'package:oracle_digital_task/core/constants/styles.dart';

class CityItem extends StatelessWidget {
  const CityItem({
    super.key,
  });

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
            'data',
            style: Styles.s20w300,
          ),
          Text(
            'data',
            style: Styles.s20w300.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
