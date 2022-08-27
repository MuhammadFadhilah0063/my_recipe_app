import 'package:app_my_resep/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 1;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: MyBottomNav(curIndex: currentPage),
    );
  }
}
