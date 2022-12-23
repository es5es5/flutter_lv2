import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/model/cursor_pagination_model.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';
import 'package:flutter_lv2/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_lv2/restaurant/view/restaurant_detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  const RestaurantScreen({super.key});

  @override
  ConsumerState<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends ConsumerState<RestaurantScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(scollListener);
  }

  void scollListener() {
    // 현재 위치가 최대 길이보다 조금 덜 되는 위치(300px)까지 오면 새로운 데이터를 추가 요청
    if (scrollController.offset >
        scrollController.position.maxScrollExtent - 300) {
      ref.read(restaurantProvider.notifier).paginate(fetchMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(restaurantProvider);

    if (data is CursorPaginationLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (data is CursorPaginationError) {
      return Center(child: Text(data.message));
    }

    final cp = data as CursorPagination;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          controller: scrollController,
          itemCount: cp.data.length + 1,
          itemBuilder: (_, index) {
            if (index == cp.data.length) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: data is CursorPaginationFetchingMore
                        ? CircularProgressIndicator()
                        : Text('No More Restaurant T^T.')),
              );
            }

            final parsedItem = cp.data[index];

            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(id: parsedItem.id),
                ));
              },
              child: RestraurantCard.fromModel(model: parsedItem),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: 16);
          },
        ));
  }
}
