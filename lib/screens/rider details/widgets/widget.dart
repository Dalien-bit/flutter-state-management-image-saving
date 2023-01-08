import 'package:flutter/material.dart';

class InfoFields extends StatelessWidget {
  const InfoFields({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
        top: 8,
        bottom: 8,
      ),
      child: Text(
        '$title $value',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}