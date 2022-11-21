import 'package:agroshop/models/category.dart';

import '../config.dart';

class Product {
  final String productName;
  final Category category;
  final String productShortDescription;
  final double productPrice;
  final double productSalePrice;
  final String productImage;
  final String productSKU;
  final String productType;
  final String productStatus;
  final String productId;
  final List<String> relatedProducts;

  Product({
    required this.productName,
    required this.category,
    required this.productShortDescription,
    required this.productPrice,
    required this.productSalePrice,
    required this.productImage,
    required this.productSKU,
    required this.productType,
    required this.productStatus,
    required this.productId,
    required this.relatedProducts,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: (json['productName'] ?? "").toString(),
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      productShortDescription:
          (json['productShortDescription'] ?? "").toString(),
      productPrice: double.parse((json['productPrice'] ?? '0.0').toString()),
      productSalePrice:
          double.parse((json['productSalePrice'] ?? '0.0').toString()),
      productImage: (json['productImage'] ?? "").toString(),
      productSKU: (json['productSKU'] ?? "").toString(),
      productType: (json['productType'] ?? "").toString(),
      productStatus: (json['productStatus'] ?? "").toString(),
      productId: (json['productId'] ?? "").toString(),
      relatedProducts: [],
    );
  }
}

extension ProductExt on Product {
  String get fullImagePath => Config.imageURL + productImage;

  int get calculateDiscount {
    double disPercent = 0;

    if (!productPrice.isNaN) {
      double regularPrice = productPrice;
      double salePrice = productSalePrice > 0 ? productSalePrice : regularPrice;

      double discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }

    return disPercent.round();
  }
}

/*import 'package:freezed_annotation/freezed_annotation.dart';

import '../config.dart';
import 'category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productsFromJson(dynamic str) => List<Product>.from(
      (str).map(
        (e) => Product.fromJson(e),
      ),
    );

@freezed
abstract class Product with _$Product {
  factory Product({
    required String? productName,
    required Category? category,
    required String? productShortDescription,
    required double? productPrice,
    required double? productSalePrice,
    required String? productImage,
    required String? productSKU,
    required String? productType,
    required String? stockStatus,
    required String? productId,
    List<String>? relatedProducts,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductExt on Product {
  String get fullImagePath => Config.imageURL + productImage!;

  int get calculateDiscount {
    double disPercent = 0;

    if (!productPrice!.isNaN) {
      double regularPrice = productPrice!;
      double salePrice =
          productSalePrice! > 0 ? productSalePrice! : regularPrice;

      double discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }

    return disPercent.round();
  }
}*/