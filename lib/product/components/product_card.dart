import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '떡볶이',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '떡볶이 맛있다.\n응 맛있어!',
                style: TextStyle(
                  color: BODY_TEXT_COLOR,
                  fontSize: 14,
                ),
              ),
              Text(
                '₩10,000',
                style: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
