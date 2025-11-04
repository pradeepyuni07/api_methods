
import 'package:api_app/data/reposiotry/api_methods.dart';
import 'package:api_app/logic/post_bloc/post_event.dart';
import 'package:api_app/logic/post_bloc/post_state.dart';
import 'package:bloc/bloc.dart';

import '../../core/constants/api_key_constants.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // final PostRepo postRepo = PostRepo();

  PostBloc() : super(PostInitial()) {
    on<PostUserEvent>(_postUserEvent);
    on<PostUpdateTitleEvent>(_postUpdateTitleEvent);
  }

  //_postUpdateTitleEvent
  void _postUpdateTitleEvent(
    PostUpdateTitleEvent event,
    Emitter<PostState> emit,
  ) async {
    final res = await ApiMethods.getTitle(event.title);
    emit(PostTitle(title: event.title));
  }

  //_postUserEvent

  void _postUserEvent(PostUserEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    final Map<String, dynamic> bodyParam = {
      ApiKeyConstants.userId: event.id,
      ApiKeyConstants.title: event.title,
    };

    try {
      print(event.id);
      print(event.title);

      final user = await ApiMethods.createUser(bodyParams: bodyParam);


      if (user != null) {
        emit(PostSuccess(post: user));
      } else {
        emit(PostError(error: "Error"));
      }
      print(".....PostSuccess State");
    } catch (e) {
      emit(PostError(error: e.toString()));
    }
  }
}
