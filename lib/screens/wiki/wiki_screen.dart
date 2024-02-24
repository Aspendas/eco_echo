import 'package:camera/camera.dart';
import 'package:eco_echo/models/wiki/categories.dart';
import 'package:eco_echo/widgets/wiki/waste_category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/camera.dart';
import '../camera/camera.dart';

class WikiScreen extends StatelessWidget {
  const WikiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cameraModel = context.read<CameraModel>();
    CameraDescription camera = cameraModel.camera;
    List<WasteCategories> categoryItems = [
      WasteCategories(
        icon: Image.asset(
          "assets/fish green.png",
          height: 24,
          width: 24,
        ),
        title: "Organics",
      ),
      WasteCategories(
        icon: Image.asset(
          "assets/bottle green.png",
          height: 24,
          width: 24,
        ),
        title: "Plastic",
      ),
      WasteCategories(
        icon: Image.asset(
          "assets/glass green.png",
          height: 24,
          width: 24,
        ),
        title: "Glass",
      ),
      WasteCategories(
        icon: Image.asset(
          "assets/clothes green.png",
          height: 24,
          width: 24,
        ),
        title: "Clothes",
      ),
      WasteCategories(
        icon: Image.asset(
          "assets/television green.png",
          height: 24,
          width: 24,
        ),
        title: "Technological",
      ),
      WasteCategories(
        icon: Image.asset(
          "assets/paper green.png",
          height: 24,
          width: 24,
        ),
        title: "Paper",
      ),
    ];

    return ListView(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CameraScreen(camera: camera),
              ),
            );
          },
          child: Container(
              margin: const EdgeInsets.all(16),
              height: 84,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff26C881)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/google-gemini-icon.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                  const SizedBox(width: 72),
                  const Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Recycle",
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "powered by Gemini",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                          ],
                        ),
                        SizedBox(height: 2)
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Categories",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryItems.length,
          itemBuilder: (context, index) {
            return WasteCategoryItem(
              categories: categoryItems[index],
              index: index,
            );
          },
        ),
      ],
    );
  }
}
