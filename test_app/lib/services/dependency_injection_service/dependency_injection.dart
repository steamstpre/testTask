import 'package:get_it/get_it.dart';
import 'package:test_app/services/repository/repository.dart';

class DependencyInjection {
  final Repository _repository = Repository();

  void setupGetIt() {
    GetIt.instance.registerSingleton(_repository);
  }
}
