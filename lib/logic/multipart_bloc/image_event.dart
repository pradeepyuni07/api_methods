import 'dart:io';

import 'package:equatable/equatable.dart';

class ImageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PickImageEvent extends ImageEvent {
  List<Object?> get props => [];
}

class UploadImageEvent extends ImageEvent {
  final File imageFile;
  UploadImageEvent(this.imageFile);

  List<Object?> get props => [imageFile];
}
