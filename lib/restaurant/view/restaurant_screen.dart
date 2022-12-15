import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/data.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';
import 'package:flutter_lv2/restaurant/model/restaurant_model.dart';
import 'package:flutter_lv2/restaurant/view/restaurant_detail_screen.dart';

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
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final parsedItem = RestaurantModel.fromJson(json: item);

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            RestaurantDetailScreen(id: parsedItem.id),
                      ));
                    },
                    child: RestraurantCard.fromModel(model: parsedItem),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(height: 16);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
