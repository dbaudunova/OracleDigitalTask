import 'dart:convert';
import 'package:oracle_digital_task/data/model/city_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CityLocalDataSource {
  Future<List<CityModel>?> getCachedCities();

  Future<void> cacheCities(List<CityModel> cities);
}

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final SharedPreferences sharedPreferences;

  CityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<CityModel>?> getCachedCities() async {
    final jsonString = sharedPreferences.getString('cities');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((cityJson) => CityModel.fromJson(cityJson)).toList();
    }
    return null;
  }

  @override
  Future<void> cacheCities(List<CityModel> cities) async {
    final cityList = cities.map((city) => city.toJson()).toList();
    final jsonString = jsonEncode(cityList);
    await sharedPreferences.setString('cities', jsonString);
  }
}
