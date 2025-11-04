import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../data/models/image_upload.dart';

class ImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImageState {
  List<Object?> get props => [];
}

class ImagePicked extends ImageState {
  final File imageFile;
  ImagePicked(this.imageFile);

  List<Object?> get props => [imageFile];
}

class ImageUploading extends ImageState {
  List<Object?> get props => [];
}

class ImageUploaded extends ImageState {
  final ImageUpload response;
  ImageUploaded(this.response);

  List<Object?> get props => [response];
}

class ImageError extends ImageState {
  final String message;
  ImageError(this.message);

  List<Object?> get props => [message];
}
