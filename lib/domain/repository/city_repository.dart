import 'package:oracle_digital_task/domain/model/city_entity.dart';

abstract class CityRepository {
  Future<List<CityEntity>> getAllCities({String? search});
}