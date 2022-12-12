import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lv2/common/const/data.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> pageRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final response = await dio.get(
      '$API_URL/restaurant',
      options: Options(
        headers: {'authorization': 'Bearer $accessToken'},
      ),
    );

    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder<List>(
            future: pageRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              print(snapshot.error);
              print(snapshot.data);
              return RestraurantCard(
                  image: Image.asset(
                    'asset/img/food/ddeok_bok_gi.jpg',
                    fit: BoxFit.cover,
                  ),
                  name: '불타는 떡볶이',
                  tags: ['떡볶이', '치즈', '매운맛'],
                  ratingsCount: 100,
                  deliveryTime: 15,
                  deliveryFee: 2000,
                  ratings: 4.52);
            },
          ),
        ),
      ),
    );
  }
}
