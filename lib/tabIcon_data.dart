import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/fitness_app/map-pointer-gps-icon-vector.jpg',
      selectedImagePath: 'assets/fitness_app/map-pointer-gps-icon-vector.jpg',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/panne.png',
      selectedImagePath: 'assets/fitness_app/panne.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/8071170.png',
      selectedImagePath: 'assets/fitness_app/8071170.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/istockphoto-1300845620-612x612.jpg',
      selectedImagePath: 'assets/fitness_app/istockphoto-1300845620-612x612.jpg',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
