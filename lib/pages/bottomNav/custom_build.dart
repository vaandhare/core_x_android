import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBuild extends StatelessWidget {
  _gridEmptyItem(String text) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontFamily: "GoogleSans",
                fontWeight: FontWeight.bold),
            maxLines: 1,
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(70.0, 8.5, 70.0, 8.5),
            child: Icon(
              Icons.add,
              size: 40.0,
              color: Colors.grey,
            ),
          ),
          color: Colors.white60,
        ),
      ],
    );
  }

  _gridItemContainer(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontFamily: "GoogleSans",
                fontWeight: FontWeight.bold
            ),
            maxLines: 1,
          ),
        ),
        Card(
          child: Container(
            width: 200,
            height: 60,
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
                      fontSize: 10.0,
                      fontFamily: "WorkSansSemiBold",
                    ),
                  ),
                  Text(
                    '₹2000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
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
    return Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Stack(children: <Widget>[
          GridView.count(
            padding: EdgeInsets.all(5.0),
            crossAxisCount: 2,
            childAspectRatio: MediaQuery
                .of(context)
                .size
                .height / 350,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' ₹20,000.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "GoogleSans"),
                          ),
                        )
                    ),
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
        ])
    );
  }
}
