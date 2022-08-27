import 'package:app_my_resep/widgets/bottom_nav_bar_widget.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 2;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: MyBottomNav(curIndex: currentPage),
    );
  }
}
