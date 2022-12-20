import 'package:agroshop/models/cart_product.dart';

import 'product.dart';

class Order {
  String? userId;
  String? cartId;
  List<CartProduct>? products;
  int? grandTotal;
  String? address;
  String? phone;

  Order({
    this.userId,
    this.cartId,
    this.products,
    this.grandTotal,
    this.address,
    this.phone,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<CartProduct> productsList =
        list.map((i) => CartProduct.fromJson(i)).toList();
    return Order(
      userId: json['userId'],
      cartId: json['cartId'],
      products: productsList,
      grandTotal: json['grandTotal'],
      address: json['address'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['cartId'] = cartId;
    data['products'] = products!.map((i) => i.toJson()).toList();
    data['grandTotal'] = grandTotal;
    data['address'] = address;
    data['phone'] = phone;
    return data;
  }
}
