import 'package:api_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../model/product.dart';

class ProductState extends Equatable {
  final Status status;
  final List<Product> productList;

  const ProductState({
    this.status = Status.loading,
    this.productList = const <Product>[],
  });
  ProductState copyWith({
     Status? status,
     List<Product>? productList,
  }) {
    return ProductState(
      status: status ?? this.status,
      productList: productList ?? this.productList,
    );
  }

  List<Object?> get props => [status, productList];
}
