import 'dart:io';

import 'package:api_app/data/reposiotry/api_methods.dart';
import 'package:api_app/logic/multipart_bloc/image_event.dart';
import 'package:api_app/logic/multipart_bloc/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final picker = ImagePicker();

  ImageBloc() : super(ImageInitial()) {
    on<PickImageEvent>(_pickImageEvent);
    on<UploadImageEvent>(_upLoadImageEvent);
  }

  void _pickImageEvent(PickImageEvent event, Emitter emit) async {
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      emit(ImagePicked(File(picked.path)));
    } else {
      emit(ImageError("image not selected"));
    }
  }

  _upLoadImageEvent(UploadImageEvent event, Emitter<ImageState> emit) async {
    emit(ImageUploading());
    final response = await ApiMethods.getImageUrl(event.imageFile);
    // print(response);

    print("${event.imageFile}******************************* $response");
    if (response != null) {
      print("******************************* $response");
      emit(ImageUploaded(response));
    } else {
      emit(ImageError("Failed to upload image"));
    }
  }
}
