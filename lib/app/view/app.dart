import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:spotlastest/feed/feed.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        home: FeedView(),
      );
    });
  }
}
