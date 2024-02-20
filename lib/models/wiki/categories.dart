import 'package:flutter/material.dart';

class WasteCategories {
  final Widget icon;
  final Widget? iconActive;
  final String title;
  final double? multiplier;
  bool? isActive;

  WasteCategories({
    required this.icon,
    required this.title,
    this.multiplier,
    this.isActive,
    this.iconActive,
  });
}
