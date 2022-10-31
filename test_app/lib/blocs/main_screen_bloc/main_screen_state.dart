part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoadedDataState extends MainScreenState {
  final List<String> _listOfNames;

  MainScreenLoadedDataState(this._listOfNames);

  List<String> get listOfNames => _listOfNames;
}
