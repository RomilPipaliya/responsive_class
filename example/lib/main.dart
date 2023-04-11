import 'package:flutter/material.dart';
import 'package:responsive_class/responsive_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveClass(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late final String screenTypeText;

    switch (Device.screenType) {
      case ScreenType.mobile:
        screenTypeText = "My screen's type is Mobile";
        break;
      case ScreenType.tablet:
        screenTypeText = "My screen's type is Tablet";
        break;
      // ScreenType can only be desktop when `maxTabletWidth`
      // is set in `ResponsiveSizer`
      case ScreenType.desktop:
        screenTypeText = "My screen's type is Desktop";
        break;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [],
      ),
    );
  }
}
