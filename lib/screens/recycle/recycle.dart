import 'package:flutter/material.dart';

import '../../models/wiki/categories.dart';

class RecycleScreen extends StatefulWidget {
  const RecycleScreen({super.key});

  @override
  State<RecycleScreen> createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  @override
  List<WasteCategories> categoryItems = [
    WasteCategories(
      icon: const Icon(
        Icons.eco,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.eco,
        size: 24,
        color: Colors.white,
      ),
      title: "Organics",
      isActive: true,
    ),
    WasteCategories(
      icon: const Icon(
        Icons.bolt,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.bolt,
        size: 24,
        color: Colors.white,
      ),
      title: "Plastic",
      isActive: false,
    ),
    WasteCategories(
      icon: const Icon(
        Icons.local_drink,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.local_drink,
        size: 24,
        color: Colors.white,
      ),
      title: "Glass",
      isActive: false,
    ),
    WasteCategories(
      icon: const Icon(
        Icons.shopping_bag,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.shopping_bag,
        size: 24,
        color: Colors.white,
      ),
      title: "Clothes",
      isActive: false,
    ),
    WasteCategories(
      icon: const Icon(
        Icons.tv,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.tv,
        size: 24,
        color: Colors.white,
      ),
      title: "Technological",
      isActive: false,
    ),
    WasteCategories(
      icon: const Icon(
        Icons.shopping_bag,
        size: 24,
        color: Color(0xff13BD04),
      ),
      iconActive: const Icon(
        Icons.shopping_bag,
        size: 24,
        color: Colors.white,
      ),
      title: "Paper",
      isActive: false,
    ),
  ];

  void makeActive(int index) {
    setState(() {
      categoryItems = List<WasteCategories>.generate(
          categoryItems.length,
          (i) => WasteCategories(
                icon: categoryItems[i].icon,
                iconActive: categoryItems[i].iconActive,
                title: categoryItems[i].title,
                isActive: i == index,
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            "Reduced Carbon Footprint",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black87,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "30 gr",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Carbon Emission",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "0.5 gr",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff13BD04),
                        ),
                      ),
                      Text(
                        "Carbon emission saved",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Slider(
                value: 1,
                onChanged: (double value) {},
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(0);
                          });
                        },
                        child: CarbonCategoryItem(
                          key: ValueKey(categoryItems[0].isActive),
                          icon: categoryItems[0].icon,
                          activeIcon: categoryItems[0].iconActive!,
                          title: categoryItems[0].title,
                          isActive: categoryItems[0].isActive!,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(1);
                          });
                        },
                        child: CarbonCategoryItem(
                          key: ValueKey(categoryItems[1].isActive),
                          icon: categoryItems[1].icon,
                          activeIcon: categoryItems[1].iconActive!,
                          title: categoryItems[1].title,
                          isActive: categoryItems[1].isActive!,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(2);
                          });
                        },
                        child: CarbonCategoryItem(
                          icon: categoryItems[2].icon,
                          activeIcon: categoryItems[2].iconActive!,
                          title: categoryItems[2].title,
                          isActive: categoryItems[2].isActive!,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(3);
                          });
                        },
                        child: CarbonCategoryItem(
                          icon: categoryItems[3].icon,
                          activeIcon: categoryItems[3].iconActive!,
                          title: categoryItems[3].title,
                          isActive: categoryItems[3].isActive!,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(4);
                          });
                        },
                        child: CarbonCategoryItem(
                          icon: categoryItems[4].icon,
                          activeIcon: categoryItems[4].iconActive!,
                          title: categoryItems[4].title,
                          isActive: categoryItems[4].isActive!,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            makeActive(5);
                          });
                        },
                        child: CarbonCategoryItem(
                          icon: categoryItems[5].icon,
                          activeIcon: categoryItems[5].iconActive!,
                          title: categoryItems[5].title,
                          isActive: categoryItems[5].isActive!,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CarbonCategoryItem extends StatelessWidget {
  const CarbonCategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
    required this.activeIcon,
  });

  final Widget icon;
  final Widget activeIcon;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive ? const Color(0xff13BD04) : Colors.transparent,
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.black87,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          isActive ? activeIcon : icon,
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : Colors.black87,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
