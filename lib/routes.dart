import 'package:flutter/material.dart';
import 'package:flutter_example_navigator_pushnamed/screens/Item/index.dart';

class Routes {
  final routes = {
    '/': (BuildContext context) => new ItemListScreen(),

    '/Item/Detail': (BuildContext context) => new ItemDetailScreen(
        item: ModalRoute.of(context)
            .settings
            .arguments), // KEYPOINT of this article
  };

  Routes() {
    runApp(new MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,

        textTheme: TextTheme(
          body1:
              TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // TextStyle
        ), // TextTheme
      ), // ThemeData

      routes: routes,
    ) // materialapp

        );
  }
}
