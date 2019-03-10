import 'package:flutter/material.dart';

import 'package:flutter_example_navigator_pushnamed/models/Item.dart';

class ItemDetailScreen extends StatefulWidget {
  final Item item;

  ItemDetailScreen({Key key, this.item}) : super(key: key);

  @override
  ItemDetailState createState() => ItemDetailState();
}

class ItemDetailState extends State<ItemDetailScreen> {
  String _displayedText;

  @override
  ItemDetailScreen get widget => super.widget; // KEYPOINT of this article

  @override
  void initState() {
    // KEYPOINT of this article

    if (widget.item == null) {
      // if pass no argument to this route, we display empty string

      _displayedText = "";
    } else {
      // if pass the item argument to this route, we display the item detail

      _displayedText = widget.item.name +
          "/" +
          widget.item.price.toString() +
          "/" +
          widget.item.qty.toString();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("the Item detail")),

      body: Center(
        child: Text(_displayedText),
      ), // Center
    ); // Scaffold
  }
}
