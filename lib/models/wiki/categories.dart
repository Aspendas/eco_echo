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

  // from json
  factory WasteCategories.fromJson(Map<String, dynamic> json) {
    return WasteCategories(
      icon: json['icon'],
      iconActive: json['iconActive'],
      title: json['title'],
      multiplier: json['multiplier'],
      isActive: json['isActive'],
    );
  }

  // to json
  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'iconActive': iconActive,
      'title': title,
      'multiplier': multiplier,
      'isActive': isActive,
    };
  }

  // to string
  @override
  String toString() {
    return 'WasteCategories(icon: $icon, iconActive: $iconActive, title: $title, multiplier: $multiplier, isActive: $isActive)';
  }
}
