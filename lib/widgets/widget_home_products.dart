import 'package:agroshop/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';
import '../models/pagination.dart';
import '../models/product.dart';
import '../models/product_filter.dart';
import '../providers.dart';

class HomeProductsWidget extends ConsumerWidget {
  const HomeProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);

    list.add(Product(
        productName: "Britania Chocko",
        category: Category(
            categoryName: "Bakery and biskuit",
            categoryImage: "/uploads/categories/biscuits.png",
            categoryId: "62672238392993"),
        productShortDescription: "hey we sell the best",
        productPrice: 30,
        productSalePrice: 26,
        productImage: "/uploads/products/biscuits.png",
        productSKU: "GA-0001",
        productType: "simple",
        productId: "kkllko90099899mm",
        productStatus: 'IN',
        relatedProducts: []));
    return Container(
      color: const Color(0xffF4F7FA),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 15,
              ),
              child: Text(
                "Top 10 Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: _productsList(ref),
        )
      ]),
    );
  }

  Widget _productsList(WidgetRef ref) {
    final products = ref.watch(
      homeProductProvider(
        ProductFilterModel(
            paginationModel: PaginationModel(page: 1, pageSize: 10)),
      ),
    );

    return products.when(
      data: (list) {
        return _buildProductList(list!);
      },
      error: (_, __) => const Center(
        child: Text("Error"),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var data = products[index];
          return GestureDetector(
            onTap: () {},
            child: ProductCard(
              model: data,
            ),
          );
        },
      ),
    );
  }
}
