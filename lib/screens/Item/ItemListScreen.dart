import 'package:flutter/material.dart';

import 'package:flutter_example_navigator_pushnamed/models/Item.dart';

class ItemListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ItemListState();
  }
}

class ItemListState extends State<ItemListScreen> {
  var _itemList = [
    {"name": "AA", "price": 10, "qty": 2},
    {"name": "BB", "price": 5, "qty": 3},
    {"name": "CC", "price": 7, "qty": 7},
  ];

  List<Item> _uiItemList;

  @override
  void initState() {
    _uiItemList = _itemList
        .map<Item>((Map _item) =>
            Item(name: _item['name'], price: _item['price'], qty: _item['qty']))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("shelf items")),

      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            Divider(color: Colors.black),

        padding: EdgeInsets.all(8.0),

        itemCount: _uiItemList.length,

        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(_uiItemList[index].name),
                    flex: 2,
                  ), // Expanded

                  Expanded(
                    child: Text(_uiItemList[index].price.toString()),
                    flex: 1,
                  ), // Expanded

                  Expanded(
                    child: Text(_uiItemList[index].qty.toString()),
                    flex: 1,
                  ), // Expanded
                ], // children
              ), // Row

              onTap: () {
                Navigator.pushNamed(context, '/Item/Detail',
                    arguments: _uiItemList[index]); // KEYPOINT of this article
              }); // GestureDetector
        }, // itemBuilder
      ), // ListView.separated
    ); // Scaffold
  }
}
