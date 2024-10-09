import 'package:oracle_digital_task/core/use_case/use_case.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';
import 'package:oracle_digital_task/domain/repository/city_repository.dart';

class GetAllCitiesUseCase implements UseCase<List<CityEntity>, Params> {
  final CityRepository repository;

  GetAllCitiesUseCase(this.repository);

  @override
  Future<List<CityEntity>> call(Params params) async {
    return await repository.getAllCities(search: params.search);
  }
}

class Params {
  final String? search;

  Params({this.search});
}
