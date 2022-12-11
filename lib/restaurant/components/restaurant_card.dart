import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/colors.dart';

class RestraurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  const RestraurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: image,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tags.join('·'),
              style: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _IconText(icon: Icons.star, label: ratings.toString()),
                renderDot(),
                _IconText(icon: Icons.receipt, label: ratingsCount.toString()),
                renderDot(),
                _IconText(
                    icon: Icons.timelapse_outlined, label: '$deliveryTime 분'),
                renderDot(),
                _IconText(
                    icon: Icons.monetization_on,
                    label: deliveryFee == 0 ? '무료' : deliveryFee.toString()),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text('·',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
