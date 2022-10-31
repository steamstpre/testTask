import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/repository/repository.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final Repository repository = GetIt.instance<Repository>();

  MainScreenBloc() : super(MainScreenInitial()) {
    on<MainScreenEvent>((event, emit) async {
      if (event is InitialEvent) {
        emit(MainScreenLoadedDataState(await repository.getUsersTitleList() as List<String>));
      }
    });
  }
}
