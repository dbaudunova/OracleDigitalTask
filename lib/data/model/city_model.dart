import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends CityEntity {
  CityModel({
    super.name,
    super.slug,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  static List<CityModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((cityJson) => CityModel.fromJson(cityJson)).toList();
  }

  CityEntity toEntity() {
    return CityEntity(
      name: name,
      slug: slug,
    );
  }
}
