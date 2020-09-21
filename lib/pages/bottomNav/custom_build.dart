import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBuild extends StatelessWidget {
  _gridEmptyItem(String text) {
    return new Column(
      children: <Widget>[
        Text(text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
              fontFamily: "WorkSansSemiBold",
            )),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(
              Icons.add,
              size: 50.0,
              color: Colors.white54,
            ),
          ),
          color: Colors.grey,
        ),
      ],
    );
  }

  _gridItemContainer(String text) {
    return Column(
      children: <Widget>[
        Text(text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15.0,
              fontFamily: "WorkSansSemiBold",
            )),
        Card(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                    'https://corex.s3.ap-south-1.amazonaws.com/pc1.png'),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Container(
              height: 25,
              width: 105,
              color: Color.fromRGBO(0, 0, 0, 0.6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'ABCD AB',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: "WorkSansSemiBold",
                    ),
                  ),
                  Text(
                    '₹2000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: "WorkSansSemiBold",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: <Widget>[
      GridView.count(
        padding: EdgeInsets.all(5.0),
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.height / 800,
        children: [
          _gridItemContainer('Processor'),
          _gridEmptyItem('Graphic Card'),
          _gridEmptyItem('Motherboard'),
          _gridEmptyItem('Ram'),
          _gridEmptyItem('Storage-SSD'),
          _gridItemContainer('Storage-HDD'),
          _gridEmptyItem('SMPS'),
          _gridEmptyItem('Cabinet'),
          _gridEmptyItem('Cards'),
          _gridItemContainer('Fans'),
          _gridEmptyItem('Others'),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 50.0,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(50.0, 0.0, 10.0, 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                    elevation: 1.0,
                    color: Colors.deepOrange,
                    shadowColor: Colors.black87,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Total:',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18.0,
                                fontFamily: "WorkSansBold"),
                          ),
                          Text(
                            ' ₹20,000.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: "WorkSansBold"),
                          )
                        ],
                      ),
                    )),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.deepOrange,
                ),
              ],
            ),
          ),
        ],
      )
    ]));
  }
}
