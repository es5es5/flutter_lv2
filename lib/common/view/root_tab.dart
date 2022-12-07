import 'package:flutter/material.dart';
import 'package:flutter_lv2/common/const/colors.dart';
import 'package:flutter_lv2/common/layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩',
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        selectedFontSize: 10,
        unselectedItemColor: BODY_TEXT_COLOR,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            this.currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood_outlined,
            ),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.receipt_long_outlined,
            ),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: '프로필',
          ),
        ],
      ),
      child: const Center(
        child: Text('Hi'),
      ),
    );
  }
}
