import 'package:flutter/cupertino.dart';
import 'package:tell_me_gringo/screens/search_advices_screen.dart';
import 'package:tell_me_gringo/shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: Constants.app_name,
      theme: CupertinoThemeData(primaryColor: CupertinoColors.systemBlue),
      home: SearchAdvicesScreen(),
    );
  }
}
