import 'package:oracle_digital_task/data/model/city_model.dart';
import 'package:dio/dio.dart';

abstract class CityRemoteDataSource {
  Future<List<CityModel>> getAllCities({String? search});
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  @override
  Future<List<CityModel>> getAllCities({String? search}) async {
    const url = 'https://odigital.pro/locations/cities/';
    final response = await Dio().get(
      url,
      queryParameters: search != null ? {'search': search} : null,
    );
    return (response.data as List)
        .map((city) => CityModel.fromJson(city))
        .toList();
  }
}
