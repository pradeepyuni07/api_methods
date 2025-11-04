
import 'package:api_app/core/constants/api_urls.dart';
import 'package:api_app/data/reposiotry/api_methods.dart';
import 'package:api_app/logic/product_bloc/product_event.dart';
import 'package:api_app/logic/product_bloc/product_state.dart';
import 'package:bloc/bloc.dart';

import '../../core/utils/enums.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<ProductGet>(_productGet);
  }

  void _productGet(ProductGet event, Emitter emit) async {
    await ApiMethods.getApiUrl(ApiUrls.endPointOfProducts)
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
