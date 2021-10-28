import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:light_app/controller/homePageController.dart';
import 'package:light_app/controller/infoPageController.dart';
import 'package:light_app/view/homepage/homepage.dart';
import 'package:light_app/view/homepage/homepageHelpers.dart';
import 'package:light_app/view/infopage/infoPageHelpers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageHelpers(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
        ChangeNotifierProvider(
          create: (context) => InfoPageHelpers(),
        ),
        ChangeNotifierProvider(
          create: (context) => InfoPageController(),
        )
      ],
      child: MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'Light App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
