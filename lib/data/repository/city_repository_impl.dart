import 'package:oracle_digital_task/data/data_source/local/city_local_data_source.dart';
import 'package:oracle_digital_task/data/data_source/remote/city_remote_data_source.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';
import 'package:oracle_digital_task/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource remoteDataSource;
  final CityLocalDataSource localDataSource;

  CityRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
  );

  @override
  Future<List<CityEntity>> getAllCities({String? search}) async {
    try {
      final cities = await remoteDataSource.getAllCities(search: search);
      localDataSource.cacheCities(cities);
      return cities.map((city) => city.toEntity()).toList();
    } catch (error) {
      final cachedCities = await localDataSource.getCachedCities();
      if (cachedCities != null) {
        return cachedCities.map((city) => city.toEntity()).toList();
      } else {
        throw Exception('Unable to fetch cities and no cached data available.');
      }
    }
  }
}
