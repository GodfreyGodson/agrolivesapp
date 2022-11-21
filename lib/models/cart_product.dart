import 'package:agroshop/models/product.dart';

class CartProduct {
  final Product product;
  final double qty;

  final String id;

  CartProduct({
    required this.product,
    required this.qty,
    required this.id,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      qty: double.parse((json['qty'] ?? '0.0').toString()),
      id: (json['_id'] ?? "").toString(),
    );
  }
}


/*import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
abstract class CartProduct with _$CartProduct {
  factory CartProduct({
    required double qty,
    required Product product,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);
}*/
