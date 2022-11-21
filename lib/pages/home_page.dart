import 'package:agroshop/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/product_card.dart';
import '../models/category.dart';
import '../widgets/widget_discount.dart';
import '../widgets/widget_home_categories.dart';
import '../widgets/widget_home_products.dart';
import '../widgets/widget_home_slider.dart';
//import '../widgets/widget_home_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Product model;

    return Scaffold(
      body: ListView(
        children: const [
          HomeSliderWidget(),
          // DiscountWidget(),
          HomeCategoriesWidget(),
          HomeProductsWidget(),

          // HomeSliderWidget(),

          // ProductCard(
          //  model: model,
          // )
        ],
      ),
    );
  }
}
