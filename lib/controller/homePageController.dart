import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier {
  List room = [
    {"room_name": "Bed Room", "lights": "4 lights", "image": AssetImage("assets/images/bed.png")},
    {
      "room_name": "Living Room",
      "lights": "2 lights",
      "image": AssetImage("assets/images/room.png")
    },
    {
      "room_name": "Kitchen ",
      "lights": "5 lights",
      "image": AssetImage("assets/images/kitchen.png")
    },
    {
      "room_name": "Bathroom ",
      "lights": "1 lights",
      "image": AssetImage("assets/images/bathtube.png")
    },
    {"room_name": "Outdoor ", "lights": "5 lights", "image": AssetImage("assets/images/house.png")},
    {
      "room_name": "Balcony ",
      "lights": "2 lights",
      "image": AssetImage("assets/images/balcony.png")
    }
  ];
}
