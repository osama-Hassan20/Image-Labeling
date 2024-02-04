import 'package:flutter/material.dart';

class CustomTextResult extends StatelessWidget {
  const CustomTextResult({super.key, required this.result});
final String result;
  @override
  Widget build(BuildContext context) {
    return  Text(
      result,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
