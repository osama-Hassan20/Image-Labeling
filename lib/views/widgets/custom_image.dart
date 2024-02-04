import 'dart:io';

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageFile});

  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: imageFile == null
          ? const SizedBox()
          : Image.file(
              imageFile!,
              fit: BoxFit.fill,
            ),
    );
  }
}
