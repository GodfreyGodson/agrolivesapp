import 'package:agroshop/models/cart_product.dart';

class Cart {
  final String userId;
  final List<CartProduct> products;
  final String cartId;

  Cart({
    required this.userId,
    required this.products,
    required this.cartId,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    ;
    final List products = (json['products'] ?? []) as List;
    final List<CartProduct> carts = products
        .map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
        .toList();
    return Cart(
      userId: (json['userId'] ?? "").toString(),
      products: carts,
      cartId: (json['cartId'] ?? "").toString(),
    );
  }
}

extension CartExt on Cart {
  double get grandTotal {
    return products
        .map((e) => e.product.productSalePrice * e.qty)
        .fold(0, (p, c) => p + c);
  }
}



/*

import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_product.dart';

//import 'cart_product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({
    required String userId,
    required List<CartProduct> products,
    required String cartId,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExt on Cart {
  double get grandTotal {
    return products
        .map((e) => e.product.productPrice * e.qty)
        .fold(0, (p, c) => p + c);
  }
}
*/