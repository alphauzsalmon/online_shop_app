part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent {
  const BottomNavigationEvent();
}

class SetBottomNavigationEvent extends BottomNavigationEvent {
  final int index;

  const SetBottomNavigationEvent(this.index);
}
