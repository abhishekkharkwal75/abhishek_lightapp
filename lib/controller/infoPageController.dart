import 'package:flutter/material.dart';

class InfoPageController extends ChangeNotifier {
  Color selectedColor = Colors.amber;
  double colorIntensity = 1;
  double slidervalue = 1;
  bool isLightOn = true;

  selectColor(Color color) {
    this.selectedColor = color;
    notifyListeners();
  }

  adjustIntensity(double intensity) {
    this.slidervalue = intensity;
    this.colorIntensity = intensity;
    notifyListeners();
  }

  switchOff() {
    this.isLightOn = !isLightOn;
    notifyListeners();
  }

  List lights = [
    {"light_name": "Main Light", "image": AssetImage("assets/images/solution1.png")},
    {"light_name": "Desk Light", "image": AssetImage("assets/images/furniture-and-household.png")},
    {"light_name": "Main Light", "image": AssetImage("assets/images/bed (1).png")},
  ];
  List colors = [
    {"Color_name": Colors.red},
    {"Color_name": Colors.green},
    {"Color_name": Colors.blue},
    {"Color_name": Colors.purple},
    {"Color_name": Colors.pink},
    {"Color_name": Colors.yellow},
    {"Color_name": Colors.white},
  ];
  List scenes = [
    {
      "scene_name": "BirthDay",
      "Color_name1": Colors.red,
    },
    {
      "scene_name": "Party",
      "Color_name1": Colors.purple,
    },
    {
      "scene_name": "Relax",
      "Color_name1": Colors.blue,
    },
    {
      "scene_name": "Fun",
      "Color_name1": Colors.green,
    }
  ];
}
