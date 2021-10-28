import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:light_app/controller/infoPageController.dart';
import 'package:provider/provider.dart';

class InfoPageHelpers extends ChangeNotifier {
  Widget topBar(BuildContext context, double height, double width, String roomName, String lights) {
    List<String> roomNameList = roomName.split(" ");
    return Padding(
      padding: const EdgeInsets.only(left: 28.0, bottom: 20, right: 0, top: 20),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/Circles.png",
            fit: BoxFit.cover,
            height: height / 4,
            width: width,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                Provider.of<InfoPageController>(context, listen: false).isLightOn =
                                    true;
                              },
                              child:
                                  Image.asset("assets/images/Icon ionic-md-arrow-round-back.png")),
                          FadeInDown(
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              " ${roomNameList[0]}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: FadeInDown(
                          duration: Duration(milliseconds: 600),
                          child: Text(
                            roomNameList[1],
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 15),
                        child: FadeInDown(
                          duration: Duration(milliseconds: 650),
                          child: Text(
                            lights,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FadeInDown(
                      duration: Duration(milliseconds: 500),
                      child: Stack(
                        children: [
                          Provider.of<InfoPageController>(context, listen: true).isLightOn
                              ? Positioned(
                                  bottom: 7,
                                  left: 85,
                                  child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor:
                                          Provider.of<InfoPageController>(context, listen: true)
                                              .selectedColor
                                              .withOpacity(Provider.of<InfoPageController>(context,
                                                      listen: false)
                                                  .colorIntensity)),
                                )
                              : SizedBox(),
                          Container(
                              height: height / 7,
                              width: width / 2,
                              // color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Image(
                                  image: AssetImage("assets/images/Group 38.png"),
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: height / 14,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Provider.of<InfoPageController>(context, listen: false).lights.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    Map lightMap =
                        Provider.of<InfoPageController>(context, listen: false).lights[index];
                    return FadeInRight(
                      duration: Duration(milliseconds: (index * 100) + 900),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height / 20,
                          width: width / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: index == 1 ? Colors.blue.shade900 : Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                  image: lightMap["image"],
                                  color: index == 1 ? Colors.white : Colors.blue.shade800,
                                ),
                                Text(
                                  lightMap["light_name"],
                                  style: TextStyle(
                                      color: index == 1 ? Colors.white : Colors.blue.shade900,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget mainBody(
    BuildContext context,
    double height,
    double width,
  ) {
    return Container(
      height: height / 1.5,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          color: Color(0xffF5F9FF)),
      child: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              duration: Duration(milliseconds: 700),
              child: Text(
                "Intensity",
                style: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeInDown(
              duration: Duration(milliseconds: 700),
              child: Row(
                children: [
                  Image(image: AssetImage("assets/images/solution2.png")),
                  Expanded(
                    child: Slider(
                      inactiveColor: Colors.grey,
                      activeColor: Colors.amber,
                      value: Provider.of<InfoPageController>(context, listen: false).slidervalue,
                      onChanged: (value) {
                        print(value);
                        Provider.of<InfoPageController>(context, listen: false)
                            .adjustIntensity(value);
                      },
                    ),
                  ),
                  Image(image: AssetImage("assets/images/solution.png")),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FadeInDown(
              duration: Duration(milliseconds: 800),
              child: Text(
                "Colors",
                style: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: height / 15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Provider.of<InfoPageController>(context, listen: false).colors.length,
                itemBuilder: (BuildContext context, int index) {
                  Map colorsMap =
                      Provider.of<InfoPageController>(context, listen: false).colors[index];
                  return FadeInRight(
                    duration: Duration(milliseconds: (index * 100) + 900),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 16),
                      child: InkWell(
                        onTap: () {
                          Provider.of<InfoPageController>(context, listen: false)
                              .selectColor(colorsMap["Color_name"]);
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: colorsMap["Color_name"],
                          child: index == 6
                              ? Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )
                              : SizedBox(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FadeInDown(
              duration: Duration(milliseconds: 800),
              child: Text(
                "Scenes",
                style: TextStyle(
                    color: Colors.blue.shade900, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              height: height / 4,
              width: width,
              // color: Colors.black,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2),
                itemCount: Provider.of<InfoPageController>(context, listen: false).scenes.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInUp(
                    duration: Duration(milliseconds: (index * 100) + 900),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 19.0, right: 10),
                      child: Container(
                        height: height / 9,
                        width: width / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Provider.of<InfoPageController>(context, listen: false)
                              .scenes[index]["Color_name1"],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0, left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/images/solution1.png")),
                              Text(
                                "${Provider.of<InfoPageController>(context, listen: false).scenes[index]["scene_name"]}",
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
