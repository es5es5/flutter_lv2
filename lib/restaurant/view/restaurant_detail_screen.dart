import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/product/components/product_card.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'dd',
      child: Column(
        children: [
          RestraurantCard(
            image: Image(
              image: AssetImage('asset/img/food/ddeok_bok_gi.jpg'),
              fit: BoxFit.cover,
            ),
            name: 'name',
            tags: ['tags'],
            ratingsCount: 100,
            deliveryTime: 30,
            deliveryFee: 3000,
            ratings: 4.21,
            isDetail: true,
            detail: 'Hello',
          ),
          ProductCard()
        ],
      ),
    );
  }
}
