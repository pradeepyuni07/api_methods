import 'package:api_app/bloc/post_bloc/post_bloc.dart';
import 'package:api_app/bloc/product_bloc/product_bloc.dart';
import 'package:api_app/data/reposiotry/post_repo.dart';
import 'package:api_app/screens/post/post_screen.dart';
import 'package:api_app/screens/product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    );
  }
}
