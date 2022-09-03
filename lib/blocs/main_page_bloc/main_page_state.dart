part of 'main_page_bloc.dart';

abstract class MainPageState extends Equatable {
  const MainPageState();
}

class MainPageInitial extends MainPageState {
  @override
  List<Object> get props => [];
}

class MainPageCompleted extends MainPageState {
  const MainPageCompleted({required this.model, required this.categories});
  final MainPageModel model;
  final List<Map<String, dynamic>> categories;

  @override
  List<Object?> get props => [model, categories];
}

class MainPageError extends MainPageState {
  const MainPageError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
