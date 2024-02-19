import 'package:eco_echo/models/wiki/categories.dart';
import 'package:eco_echo/widgets/wiki/waste_category_item.dart';
import 'package:flutter/material.dart';

class WikiScreen extends StatelessWidget {
  const WikiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WasteCategories> categoryItems = [
      WasteCategories(
        icon: const Icon(
          Icons.eco,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Organics",
      ),
      WasteCategories(
        icon: const Icon(
          Icons.bolt,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Plastic",
      ),
      WasteCategories(
        icon: const Icon(
          Icons.local_drink,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Glass",
      ),
      WasteCategories(
        icon: const Icon(
          Icons.shopping_bag,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Clothes",
      ),
      WasteCategories(
        icon: const Icon(
          Icons.tv,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Technological",
      ),
      WasteCategories(
        icon: const Icon(
          Icons.shopping_bag,
          size: 24,
          color: Color(0xff13BD04),
        ),
        title: "Paper",
      ),
    ];

    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffADF5D6)),
          child: Text("asd"),
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
            );
          },
        ),
      ],
    );
  }
}
