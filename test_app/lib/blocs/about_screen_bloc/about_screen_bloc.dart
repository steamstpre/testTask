import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:test_app/models/user_model.dart';
import 'package:test_app/services/repository/repository.dart';

part 'about_screen_event.dart';
part 'about_screen_state.dart';

class AboutScreenBloc extends Bloc<AboutScreenEvent, AboutScreenState> {
  final Repository repository = GetIt.instance<Repository>();
  AboutScreenBloc() : super(AboutScreenInitial()) {
    on<AboutScreenEvent>((event, emit) {
      if (event is SelectTitleEvent) {
        emit(LoadDataAboutState(repository.getUserByIndex(event._idOfTitle)));
      }
    });
  }
}
