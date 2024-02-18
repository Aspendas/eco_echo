import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:eco_echo/screens/camera/camera.dart';
import 'package:eco_echo/screens/recycle/recycle.dart';
import 'package:eco_echo/screens/wiki/wiki_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';

import '../models/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final gemini = Gemini.instance;
  var text = "";
  int currentPageIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraModel = context.read<CameraModel>();
    CameraDescription camera = cameraModel.camera;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Eco Echo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromRGBO(191, 216, 175, 1),
      ),
      body: [
        // Home page
        const WikiScreen(),

        // Notifications page
        const RecycleScreen(),

        // Messages page
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        height: 70,
        indicatorColor: const Color.fromRGBO(185, 200, 180, 1),
        backgroundColor: const Color.fromRGBO(
          225,
          240,
          218,
          1,
        ),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.recycling),
            label: 'Recycle',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraScreen(camera: camera),
            ),
          );
        },
        backgroundColor: const Color.fromRGBO(191, 216, 175, 1),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
