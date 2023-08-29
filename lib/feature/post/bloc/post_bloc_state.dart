part of 'post_bloc_bloc.dart';


abstract class PostBlocState {}

abstract class PostBlocActionState extends PostBlocState{}

class PostBlocInitial extends PostBlocState {}

class PostBlocLoadingState extends PostBlocState{}

class FetchingDataSuccessState extends PostBlocState {
  final List<PostUiDataModel> posts;

  FetchingDataSuccessState({required this.posts});
}
