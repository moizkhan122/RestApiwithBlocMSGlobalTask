import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/feature/post/PostDataModel/PostDataModel.dart';
import 'package:flutter_application_1/feature/post/repos/post_repo.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBlocBloc() : super(PostBlocInitial()) {
    on<PostBlocInitialEvent>(postBlocInitialEvent);
  }

  Future<FutureOr<void>> postBlocInitialEvent(PostBlocInitialEvent event, Emitter<PostBlocState> emit) async {
    emit(PostBlocLoadingState());
    
    List<PostUiDataModel>  posts = await PostsRepo.fetchingData();
    emit(FetchingDataSuccessState(posts: posts));
  }
}
