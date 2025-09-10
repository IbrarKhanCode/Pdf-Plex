import 'package:flutter/material.dart';

class BottomWidgets extends StatelessWidget {

  final String title;
  final String image;
  final bool isSelected;
  final VoidCallback onTapped;

  const BottomWidgets({super.key, required this.title, required this.image, required this.isSelected, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
           onTap: onTapped,
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(15)
            ),
            child: Image.asset(image),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(title,style: TextStyle(color: Colors.grey,fontSize: 10),)
      ],
    );
  }
}
