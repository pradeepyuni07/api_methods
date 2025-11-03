import 'package:api_app/bloc/product_bloc/product_event.dart';
import 'package:api_app/bloc/product_bloc/product_state.dart';
import 'package:api_app/core/constants/api_urls.dart';
import 'package:bloc/bloc.dart';

import '../../core/utils/enums.dart';
import '../../data/reposiotry/product_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<ProductGet>(_productGet);
  }

  void _productGet(ProductGet event, Emitter emit) async {
    await ProductRepo.getApi(ApiUrls.products)
        .then((value) {
          emit(state.copyWith(status: Status.completed, productList: value));
        })
        .onError((error, StackTrace) {
          emit(
            state.copyWith(
              status: Status.error,
              productList: state.productList,
            ),
          );
        });
  }
}
