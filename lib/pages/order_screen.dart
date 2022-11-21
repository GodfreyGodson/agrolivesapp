import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/order/order_status_widget.dart';
import '../../widgets/order/order_tracking_widget.dart';
import '../providers.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = ref.watch(cartItemsProvider);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('My orders'),
            backgroundColor: CustomColor.primaryColor,
          ),
          body: ListView.builder(
              itemCount: cartProvider.cartModel!.products.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartModel!.products[index];
                return Text(product.product.productName);
              })),
    );
  }
}
