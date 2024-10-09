import 'package:oracle_digital_task/data/data_source/remote/city_remote_data_source.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';
import 'package:oracle_digital_task/domain/repository/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource dataSource;

  CityRepositoryImpl(this.dataSource);

  @override
  Future<List<CityEntity>> getAllCities({String? search}) async {
    return await dataSource.getAllCities(search: search);
  }
}
