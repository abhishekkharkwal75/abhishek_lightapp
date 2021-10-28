import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:light_app/controller/homePageController.dart';
import 'package:light_app/view/infopage/infoPage.dart';
import 'package:provider/provider.dart';

class HomePageHelpers extends ChangeNotifier {
  Widget topBar(BuildContext context, double height, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, bottom: 20, right: 28, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeIn(
            duration: Duration(milliseconds: 500),
            child: Text(
              "Control\npanel",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          FadeIn(
            duration: Duration(milliseconds: 500),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainBody(BuildContext context, double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          color: Color(0xffF5F9FF)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 500),
              child: Text(
                "All Rooms",
                style: TextStyle(
                    color: Colors.blue.shade800, fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: Provider.of<HomePageController>(context, listen: false).room.length,
              itemBuilder: (BuildContext context, int index) {
                Map roomMap = Provider.of<HomePageController>(context, listen: false).room[index];
                return FadeInDown(
                    duration: Duration(milliseconds: (index * 100) + 900),
                    child: roomCard(context, height, width, roomMap));
              },
            ),
          ],
        ),
      ),
    );
  }

  roomCard(BuildContext context, double height, double width, Map roomMap) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 0, right: 20, bottom: 0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoPage(
                  roomName: roomMap["room_name"],
                  lights: roomMap["lights"],
                ),
              ));
        },
        child: Container(
          height: height / 16,
          width: width / 5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: roomMap["image"]),
                SizedBox(
                  height: 20,
                ),
                Text(
                  roomMap["room_name"],
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  roomMap["lights"],
                  style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w500, fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
