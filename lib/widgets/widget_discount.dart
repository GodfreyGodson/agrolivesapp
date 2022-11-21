import 'package:flutter/material.dart';

import '../models/discount.dart';
import '../utils/dimensions.dart';

class DiscountWidget extends StatefulWidget {
  const DiscountWidget({Key? key}) : super(key: key);

  @override
  State<DiscountWidget> createState() => _DiscountWidgetState();
}

class _DiscountWidgetState extends State<DiscountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _discountBannerWidget(context),
    );
  }

  _discountBannerWidget(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: DiscountList.list().length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Discount discount = DiscountList.list()[index];
          return Padding(
            padding: const EdgeInsets.only(left: Dimensions.marginSize),
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width - 100,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    child: Image.asset(
                      discount.image!,
                      fit: BoxFit.cover,
                      height: 180,
                      width: MediaQuery.of(context).size.width - 100,
                    ),
                  ),
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.heightSize,
                    left: Dimensions.marginSize,
                    child: Text(
                      'Get ${discount.discount}% off',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.extraLargeTextSize),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
