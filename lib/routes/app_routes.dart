import 'package:app_my_resep/pages/bookmark_page.dart';
import 'package:app_my_resep/pages/home/mobile_home_page.dart';
import 'package:app_my_resep/pages/responsive/responsive_layout.dart';
import 'package:app_my_resep/pages/search_page.dart';
import 'package:app_my_resep/pages/splash_page.dart';
import 'package:app_my_resep/routes/named_routes.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage<dynamic>> listRoute = [
    GetPage(
      name: NameRoute.home,
      page: () => ResponsiveLayout(mobileScaffold: const MobileHomePage()),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: NameRoute.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: NameRoute.search,
      page: () => const SearchPage(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: NameRoute.bookmark,
      page: () => const BookmarkPage(),
      transition: Transition.noTransition,
    ),
  ];
}
