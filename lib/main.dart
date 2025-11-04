

import 'package:api_app/presentations/imagescreen/image_upload_screen.dart';
import 'package:api_app/presentations/post/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/post_bloc/post_bloc.dart';
import 'logic/product_bloc/product_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: ImageUploadScreen()),
    );
  }
}
