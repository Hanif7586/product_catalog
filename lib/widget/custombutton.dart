import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final Image image;
  const Custombutton({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 80,
        height: 65,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: image,
          ),
        ),
      ),
    );
  }
}
