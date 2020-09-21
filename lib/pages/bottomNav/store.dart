import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  _storeCard(String url, String text) {
    return new Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Icon(
              Icons.laptop,
              size: 40.0,
              color: Colors.white,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: Colors.deepOrangeAccent,
        ),
        Text(text,
            style: TextStyle(
              color: Colors.deepOrange,
              fontSize: 15.0,
              fontFamily: "WorkSansSemiBold",
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Center(
          child: GridView.count(
            padding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 5.0),
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.height / 900,
            children: [
              _storeCard('abcd', 'Processor'),
              _storeCard('abcd', 'Graphic Card'),
              _storeCard('abcd', 'Motherboard'),
              _storeCard('abcd', 'Ram'),
              _storeCard('abcd', 'Storage-SSD'),
              _storeCard('abcd', 'Storage-HDD'),
              _storeCard('abcd', 'SMPS'),
              _storeCard('abcd', 'Cabinet'),
              _storeCard('abcd', 'Cards'),
              _storeCard('abcd', 'Fans'),
              _storeCard('abcd', 'Others'),
            ],
          ),
        ));
  }
}
