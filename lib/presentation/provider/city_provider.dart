import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oracle_digital_task/data/data_source/local/city_local_data_source.dart';
import 'package:oracle_digital_task/data/data_source/remote/city_remote_data_source.dart';
import 'package:oracle_digital_task/data/repository/city_repository_impl.dart';
import 'package:oracle_digital_task/domain/model/city_entity.dart';
import 'package:oracle_digital_task/domain/repository/city_repository.dart';
import 'package:oracle_digital_task/domain/use_case/get_all_cities_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final cityRepositoryProvider = Provider<CityRepository>((ref) {
  final remoteDataSource = ref.read(cityRemoteDataSourceProvider);
  final localDataSource = ref.read(cityLocalDataSourceProvider);
  return CityRepositoryImpl(remoteDataSource, localDataSource);
});

final getCitiesProvider = Provider<GetAllCitiesUseCase>((ref) {
  final repository = ref.read(cityRepositoryProvider);
  return GetAllCitiesUseCase(repository);
});

final cityListProvider =
    FutureProvider.autoDispose.family<List<CityEntity>, String?>((ref, search) {
  final getCities = ref.read(getCitiesProvider);
  return getCities(Params(search: search));
});

final cityRemoteDataSourceProvider = Provider<CityRemoteDataSource>((ref) {
  return CityRemoteDataSourceImpl();
});

final cityLocalDataSourceProvider = Provider<CityLocalDataSource>((ref) {
  final sharedPreferences = ref.read(sharedPreferencesProvider);
  return CityLocalDataSourceImpl(sharedPreferences: sharedPreferences);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
