import 'package:app_my_resep/common/theme.dart';
import 'package:app_my_resep/routes/named_routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyBottomNav extends StatelessWidget {
  @required
  final int curIndex;
  const MyBottomNav({Key? key, required this.curIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listRoute = [
      NameRoute.home,
      NameRoute.search,
      NameRoute.bookmark,
    ];

    return BottomNavigationBar(
      iconSize: 25,
      selectedItemColor: AppTheme.bgColor,
      unselectedItemColor: const Color(0xFF6c677e),
      backgroundColor: const Color(0xFF201c2b),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.house),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.solidBookmark),
          label: "Bookmark",
        ),
      ],
      currentIndex: curIndex,
      onTap: (value) => Get.offNamed(listRoute[value]),
    );
  }
}
