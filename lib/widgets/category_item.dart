import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({this.title, this.color, this.id});
  final String id;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealsScreen.routeName,
          arguments: {'id': id, 'title': title},
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black26, offset: Offset(0.5, 0.5))
          ],
          gradient: LinearGradient(
              colors: [color.withOpacity(0.3), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
