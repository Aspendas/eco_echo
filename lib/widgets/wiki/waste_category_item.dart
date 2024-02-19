import 'package:eco_echo/models/wiki/categories.dart';
import 'package:eco_echo/screens/wiki/detail_screen.dart';
import 'package:flutter/material.dart';

class WasteCategoryItem extends StatelessWidget {
  const WasteCategoryItem({Key? key, required this.categories})
      : super(key: key);

  final WasteCategories categories;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => WikiDetailScreen(
              title: categories.title,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffADF5D6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: categories.icon,
            ),
            const SizedBox(width: 12),
            Text(
              categories.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
