import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/product/components/product_card.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Card Detail',
      child: CustomScrollView(
        slivers: [
          renderTop(),
          renderLabel(),
          renderProduct(),
        ],
      ),
    );
  }

  renderTop() {
    return SliverToBoxAdapter(
      child: RestraurantCard(
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
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  renderProduct() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }
}
