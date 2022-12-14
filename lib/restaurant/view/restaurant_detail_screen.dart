import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/data.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/product/components/product_card.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    super.key,
  });

  Future getRestaurantDetail() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get(
      '$API_URL/restaurant/$id',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );

    print(response);

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Card Detail',
      child: FutureBuilder(
        future: getRestaurantDetail(),
        builder: (_, snapshot) {
          return CustomScrollView(
            slivers: [
              renderTop(),
              renderLabel(),
              renderProduct(),
            ],
          );
        },
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
