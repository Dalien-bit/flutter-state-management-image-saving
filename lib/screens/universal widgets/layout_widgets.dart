import 'package:flutter/material.dart';

AppBar appBar(String text) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      text,
      style: const TextStyle(color: Colors.black),
    ),
  );
}
