import 'package:flutter/material.dart';
import 'package:light_app/view/homepage/homepageHelpers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomePageHelpers>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        elevation: 1,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Image(
                image: AssetImage("assets/images/bulb.png"),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/Icon feather-home.png")), label: ""),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/Icon feather-settings.png")), label: "")
        ],
      ),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                provider.topBar(context, height, width),
                provider.mainBody(context, height, width)
              ],
            ),
          )),
    );
  }
}
