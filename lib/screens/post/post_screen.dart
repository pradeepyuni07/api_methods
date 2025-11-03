import 'package:api_app/bloc/post_bloc/post_bloc.dart';
import 'package:api_app/bloc/post_bloc/post_event.dart';
import 'package:api_app/bloc/post_bloc/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController id_Controller = TextEditingController();
  final TextEditingController title_Controller = TextEditingController();
  final TextEditingController put_title_Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: id_Controller,
              decoration: const InputDecoration(hintText: "enter user_id"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: title_Controller,
              decoration: const InputDecoration(hintText: "enter title"),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                context.read<PostBloc>().add(
                  PostUserEvent(
                    id: int.parse(id_Controller.text),
                    title: title_Controller.text.trim(),
                  ),
                );
              },
              child: const Text("post data"),
            ),
            const SizedBox(height: 30),
            BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PostSuccess) {
                  return Column(
                    children: [
                      Text("${state.post.userId}"),
                      const SizedBox(height: 30),
                      Text("${state.post.title}"),
                    ],
                  );
                } else if (state is PostError) {
                  return Text("Error: ${state.error}");
                }
                return const SizedBox();
              },
            ),

            SizedBox(height: 30,),
            TextField(
              controller: put_title_Controller,
              decoration: const InputDecoration(hintText: "enter title"),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              context.read<PostBloc>().add(PostUpdateTitleEvent(put_title_Controller.text));
            }, child: Text("update Title"))

          ],
        ),
      ),
    );
  }
}
