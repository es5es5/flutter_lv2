import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RestraurantCard(
              image: Image.asset(
                'asset/img/food/ddeok_bok_gi.jpg',
                fit: BoxFit.cover,
              ),
              name: '불타는 떡볶이',
              tags: ['떡볶이', '치즈', '매운맛'],
              ratingCount: 100,
              deliveryTime: 15,
              deliveryFee: 2000,
              rating: 4.52),
        ),
      ),
    );
  }
}
