// Create a model class:
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraModel extends ChangeNotifier {
  final CameraDescription camera;

  CameraModel(this.camera);
}
