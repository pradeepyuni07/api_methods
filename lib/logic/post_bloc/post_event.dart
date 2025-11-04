import 'package:equatable/equatable.dart';

class PostEvent extends Equatable{

  List<Object?> get props => [];

}
class PostUserEvent extends PostEvent{
  final int id;
  final String title;

  PostUserEvent({required this.id,required this.title});
  @override

  List<Object?> get props => [id,title];
}

class PostUpdateTitleEvent extends PostEvent{
    final String title;

    PostUpdateTitleEvent(this.title);

    List<Object?> get props=> [title];
}