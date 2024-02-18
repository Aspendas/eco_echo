import 'package:flutter/material.dart';

class WasteCategories {
  final Widget icon;
  final Widget? iconActive;
  final String title;
  bool? isActive;

  WasteCategories({
    required this.icon,
    required this.title,
    this.isActive,
    this.iconActive,
  });
}
