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
}
