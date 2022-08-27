import 'package:app_my_resep/common/theme.dart';
import 'package:app_my_resep/models/generate_recipe.dart';
import 'package:app_my_resep/widgets/bottom_nav_bar_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  PageController pageController = PageController();
  var _currPage = 0.0;
  int currentPage = 0;
  var listRecipe = GenerateRecipe.listRecipe;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPage = pageController.page!;
        print('Current value is ${_currPage.toString()}');
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navBar = MyBottomNav(curIndex: currentPage);

    return Scaffold(
      backgroundColor: AppTheme.lightPurple,
      body: ListView(
        children: [
          // Bookmark Page View
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                alignment: Alignment.center,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: listRecipe.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: index.isEven
                                  ? const Color(0xFF69c5df)
                                  : const Color(0xFF9294cc),
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(listRecipe[index].urlImage),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5,
                                )
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
              DotsIndicator(
                // reversed: true,
                dotsCount: (listRecipe.length <= 10) ? listRecipe.length : 10,
                position: _currPage,
                decorator: DotsDecorator(
                  activeColor: AppTheme.darkPurple,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Recipe List
          Container(
            padding:
                const EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 20),
            decoration: const BoxDecoration(
                // color: Colors.black.withOpacity(0.95),
                // borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                children: [
                  InkWell(
                    onTap: () => print("object"),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(listRecipe[index].urlImage),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                              )
                            ]),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        width: 260,
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: AppTheme.darkPurple,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 2.5,
                              )
                            ]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(listRecipe[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.percent,
                                        color:
                                            Color.fromARGB(255, 226, 219, 219),
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          "${listRecipe[index].calorie} calorie",
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 226, 219, 219),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        FontAwesomeIcons.clock,
                                        color:
                                            Color.fromARGB(255, 226, 219, 219),
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text("${listRecipe[index].time} minute",
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 226, 219, 219),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  )
                ],
              ),
              itemCount: listRecipe.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 30,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: navBar,
    );
  }
}
