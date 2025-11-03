import 'package:api_app/bloc/post_bloc/post_event.dart';
import 'package:api_app/bloc/post_bloc/post_state.dart';
import 'package:api_app/data/reposiotry/post_repo.dart';
import 'package:bloc/bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo = PostRepo();

  PostBloc() : super(PostInitial()) {
    on<PostUserEvent>(_postUserEvent);
    on<PostUpdateTitleEvent>(_postUpdateTitleEvent);
  }

  void _postUpdateTitleEvent(
    PostUpdateTitleEvent event,
    Emitter<PostState> emit,
  ) async {
    final res = await postRepo.getTitle(event.title);

    emit(PostTitle(title: event.title));
  }

  void _postUserEvent(PostUserEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());

    try {
      print(event.id);
      print(event.title);

      final user = await postRepo.createUser(event.id, event.title);

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
