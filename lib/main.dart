import 'package:flutter/material.dart';
import 'package:teste/pages/home.dart';
import 'package:teste/pages/choose_location.dart';
import 'package:teste/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  },
));