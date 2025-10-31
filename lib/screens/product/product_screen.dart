import 'package:api_app/bloc/product_bloc/product_bloc.dart';
import 'package:api_app/bloc/product_bloc/product_event.dart';
import 'package:api_app/bloc/product_bloc/product_state.dart';
import 'package:api_app/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return CircularProgressIndicator();

            case Status.completed:
              return ListView.builder(
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  print("object");
                  return Column(
                    children: [
                      Text(state.productList[index].title ?? "Title"),
                      SizedBox(
                        height: 100,
                        child: Image.network(
                          state.productList[index].images!.first,
                        ),
                      ),
                    ],
                  );
                },
              );
            case Status.error:
              return Center(child: Text("No Data found"));
          }
        },
      ),
    );
  }
}
