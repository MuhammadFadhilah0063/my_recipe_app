import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  @required
  final Widget mobileScaffold;
  // @required
  // final Widget tabletScaffold;
  // @required
  // final Widget desktopScaffold;

  ResponsiveLayout({
    required this.mobileScaffold,
    // required this.tabletScaffold,
    // required this.desktopScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return mobileScaffold;
        } else {
          return const Scaffold(
            body: Center(child: Text("KOSONG BOS")),
          );
        }
        // if (constraints.maxWidth < 500) {
        //   return mobileScaffold;
        // }
        // if (constraints.maxWidth < 1100) {
        //   return tabletScaffold;
        // } else {
        //   return desktopScaffold;
        // }
      },
    );
  }
}
