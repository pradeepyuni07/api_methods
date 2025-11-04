import 'package:equatable/equatable.dart';

import '../../data/models/post_model.dart';



sealed class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostError extends PostState {
  final String error;

  PostError({required this.error});

  List<Object?> get props => [error];
}

class PostTitle extends PostState {
  final String title;
  PostTitle({required this.title});

  List<Object?> get props => [title];
}

class PostSuccess extends PostState {
  final Post post;
  PostSuccess({required this.post});

  List<Object?> get props => [post];
}
