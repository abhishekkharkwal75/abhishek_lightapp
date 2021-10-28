import 'package:flutter/material.dart';
import 'package:light_app/controller/infoPageController.dart';
import 'package:light_app/view/infopage/infoPageHelpers.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  final String roomName;
  final String lights;

  const InfoPage({Key key, this.roomName, this.lights}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<InfoPageHelpers>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        Provider.of<InfoPageController>(context, listen: false).isLightOn = true;
        return;
      },
      child: Scaffold(
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
                icon: Image(image: AssetImage("assets/images/Icon feather-settings.png")),
                label: "")
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    provider.topBar(context, height, width, widget.roomName, widget.lights),
                    provider.mainBody(context, height, width)
                  ],
                ),
                Positioned(
                  right: 20,
                  top: height / 3.5,
                  child: InkWell(
                    onTap: () {
                      Provider.of<InfoPageController>(context, listen: false).switchOff();
                    },
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 2,
                      borderRadius: BorderRadius.circular(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                  image: AssetImage("assets/images/Icon awesome-power-off.png")),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
