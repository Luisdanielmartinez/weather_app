import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    color: Colors.white70,
  ),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.white70, style: BorderStyle.solid)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid)),
  hintText: "City Name",
  hintStyle: TextStyle(color: Colors.white70),
);
