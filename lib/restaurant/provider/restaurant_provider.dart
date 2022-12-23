import 'package:flutter_lv2/common/model/cursor_pagination_model.dart';
import 'package:flutter_lv2/restaurant/repository/restaurant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantStateNotifier, CursorPaginationBase>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);
  final notifier = RestaurantStateNotifier(repository: repository);

  return notifier;
});

class RestaurantStateNotifier extends StateNotifier<CursorPaginationBase> {
  final RestaurantRepository repository;
  RestaurantStateNotifier({
    required this.repository,
  }) : super(CursorPaginationLoading()) {
    paginate();
  }

  void paginate({
    int fetchCount = 20,
    // 추가로 데이터 더 가져오기
    // true: 추가로 데이터 더 가져옴
    // false: 새로고침 (현재 상태를 덮어씌움)
    bool fetchMore = false,
    // 강제로 다시 로딩하기
    // true: CursorPaginationLoading()
    bool forceRefetch = false,
  }) async {
    // 1. CursorPagiation - 정상적으로 데이터가 있는 상태
    // 2. CursorPagiationLoading - 데이터가 로딩 중인 상태 (현재 캐시 없음)
    // 3. CursorPaginationError - 에러 상태
    // 4. CursorPaginationRefetching - 첫번쨰 페이지부터 다시 데이터를 가져올 때
    // 5. CursorPaginationFetchMore - 추가 데이터를 paginate 해오라는 요청을 받았을 때

    // 바로 반환되는 상황
    // 1. hasMore = false (기존 상태에서 이미 다음 데이터가 없다는 값을 들고 있다면)
    if (state is CursorPagination && !forceRefetch) {
      final pState = state as CursorPagination;
      if (!pState.meta.hasMore) {
        return;
      }
    }
    // 2. fetchMore = true (로딩 중)
    //   로딩 중인데 fetchMore가 아닐 때 -> 새로고침의 의도가 있다.
  }
}