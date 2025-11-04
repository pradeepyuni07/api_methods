import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/multipart_bloc/image_bloc.dart';
import '../../logic/multipart_bloc/image_event.dart';
import '../../logic/multipart_bloc/image_state.dart';

class ImageUploadScreen extends StatelessWidget {
  const ImageUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImageBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Image Upload')),
        body: BlocConsumer<ImageBloc, ImageState>(
          listener: (context, state) {},
          builder: (context, state) {
            context.read<ImageBloc>();

            if (state is ImageInitial) {
              return Center(
                child: ElevatedButton(
                  onPressed: () =>
                      context.read<ImageBloc>().add(PickImageEvent()),
                  child: Text("Pick Image"),
                ),
              );
            } else if (state is ImagePicked) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(state.imageFile, height: 200),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => context.read<ImageBloc>().add(
                        UploadImageEvent(state.imageFile),
                      ),
                      child: const Text("Upload Image"),
                    ),
                  ],
                ),
              );
            } else if (state is ImageUploading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageUploaded) {
              return Center(
                child: Image.network('${state.response.location}', height: 200),
              );
            } else if (state is ImageError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
