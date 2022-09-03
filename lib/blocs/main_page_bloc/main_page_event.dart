part of 'main_page_bloc.dart';

abstract class MainPageEvent extends Equatable {
  const MainPageEvent();
}

class LoadMainPageData extends MainPageEvent {
  @override
  List<Object?> get props => [];
}

class ChooseCategory extends MainPageEvent {
  const ChooseCategory({required this.model, required this.categories});
  final MainPageModel model;
  final List<Map<String, dynamic>> categories;

  @override
  List<Object?> get props => [model, categories];
}
