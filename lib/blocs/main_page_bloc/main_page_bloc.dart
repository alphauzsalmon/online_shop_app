import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_shop_app/constants/categories.dart';
import 'package:online_shop_app/infrastructure/models/main_page_model.dart';
import 'package:online_shop_app/infrastructure/repositories/main_page_repositories.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final BaseMainPageRepository _repository;
  MainPageBloc(this._repository) : super(MainPageInitial()) {
    on<LoadMainPageData>(
        (LoadMainPageData event, Emitter<MainPageState> emit) async {
      try {
        final MainPageModel model = await _repository.getProducts();
        emit(MainPageCompleted(model: model, categories: categories));
      } catch (err) {
        emit(MainPageError(err.toString()));
      }
    });

    on<ChooseCategory>(
        (ChooseCategory event, Emitter<MainPageState> emit) {
      try {
        emit(MainPageInitial());
        emit(MainPageCompleted(
            model: event.model, categories: event.categories));
      } catch (err) {
        emit(MainPageError(err.toString()));
      }
    });
  }
}
