part of 'about_screen_bloc.dart';

@immutable
abstract class AboutScreenEvent {}

class SelectTitleEvent extends AboutScreenEvent {
  final int _idOfTitle;

  SelectTitleEvent(this._idOfTitle);
}
