import 'package:bloc/bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super (const BottomNavigationState(0)) {
    on<SetBottomNavigationEvent>(setState);
  }

  void setState(SetBottomNavigationEvent event, Emitter<BottomNavigationState> emit) {
    emit(BottomNavigationState(event.index));
  }
}
