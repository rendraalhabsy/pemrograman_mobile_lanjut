// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:routing/routes.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
