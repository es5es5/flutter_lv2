import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';
import 'package:flutter_lv2/product/components/product_card.dart';
import 'package:flutter_lv2/restaurant/components/restaurant_card.dart';
import 'package:flutter_lv2/restaurant/model/restaurant_detail_model.dart';
import 'package:flutter_lv2/restaurant/model/restaurant_model.dart';
import 'package:flutter_lv2/restaurant/provider/restaurant_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletons/skeletons.dart';

class RestaurantDetailScreen extends ConsumerStatefulWidget {
  final String id;

  RestaurantDetailScreen({
    required this.id,
    super.key,
  });

  ConsumerState<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends ConsumerState<RestaurantDetailScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(restaurantProvider.notifier).getDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(restaurantDetailProvider(widget.id));

    if (state == null) {
      return const DefaultLayout(
          child: Center(child: CircularProgressIndicator()));
    }

    return DefaultLayout(
        title: 'Card Detail',
        child: CustomScrollView(
          slivers: [
            renderTop(model: state),
            if (state is! RestaurantDetailModel) renderLoading(),
            if (state is RestaurantDetailModel) renderLabel(),
            if (state is RestaurantDetailModel)
              renderProduct(products: state.products),
          ],
        ));
  }

  SliverPadding renderLoading() {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
          delegate: SliverChildListDelegate(List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: SkeletonParagraph(
            style: SkeletonParagraphStyle(lines: 5, padding: EdgeInsets.zero),
          ),
        ),
      ))),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantModel model,
  }) {
    return SliverToBoxAdapter(
      child: RestraurantCard.fromModel(
        model: model,
        isDetail: true,
      ),
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverToBoxAdapter(
        child: Text(
          '??????',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  renderProduct({
    required List<RestaurantProductModel> products,
  }) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final model = products[index];
            return Padding(
              padding: EdgeInsets.only(top: 16),
              child: ProductCard.fromModel(model: model),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}
