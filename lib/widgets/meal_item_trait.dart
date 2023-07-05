import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({required this.icon, required this.lable, super.key});
  final IconData icon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          lable,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
