import 'dart:convert';
import 'dart:ui';

import 'package:core_x/api_response/user_response.dart';
import 'package:core_x/pages/infoPages/custom_parts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomBuild extends StatefulWidget {
  @override
  _CustomBuildState createState() => _CustomBuildState();
}

class _CustomBuildState extends State<CustomBuild> {
  String userId = "5f97c9f544f3c220cca33dd1";

  Future<UserResponse> _fetchUserData() async {
    final url = 'http://10.0.2.2:3000/users/findUser';
    final response = await http.post(url, body: {'id': "$userId"});

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  _gridEmptyItem(String text, String type) {
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
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CustomParts(
                        type: type,
                        title: text,
                        userId: userId,
                      )),
            );
          },
          child: Card(
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
        ),
      ],
    );
  }

  _gridItemContainer(String text, String model) {
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
                    '$model',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontFamily: "WorkSansSemiBold",
                    ),
                  ),
                  Text(
                    '₹0000',
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
    return Container(
        color: Colors.white,
        child: FutureBuilder(
          future: _fetchUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserResponse data = snapshot.data;
              return buildView(data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
              ),
            );
          },
        )
    );
  }

  Widget buildView(UserResponse data) {
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
              data.customBuild.processor.isNotEmpty ? _gridItemContainer(
                  'Processor', data.customBuild.processor) : _gridEmptyItem(
                  'Processor', 'processor'),
              data.customBuild.gpu.isNotEmpty ? _gridItemContainer(
                  'Graphic Card', data.customBuild.gpu) : _gridEmptyItem(
                  'Graphic Card', 'gpu'),
              data.customBuild.motherboard.isNotEmpty ? _gridItemContainer(
                  'Motherboard', data.customBuild.motherboard) : _gridEmptyItem(
                  'Motherboard', 'motherboard'),
              data.customBuild.ram.isNotEmpty ? _gridItemContainer(
                  'Ram', data.customBuild.ram) : _gridEmptyItem('Ram', 'ram'),
              data.customBuild.ssd.isNotEmpty ? _gridItemContainer(
                  'Storage-SSD', data.customBuild.ssd) : _gridEmptyItem(
                  'Storage-SSD', 'ssd'),
              data.customBuild.hdd.isNotEmpty ? _gridItemContainer(
                  'Storage-HDD', data.customBuild.hdd) : _gridEmptyItem(
                  'Storage-HDD', 'hdd'),
              data.customBuild.smps.isNotEmpty ? _gridItemContainer(
                  'SMPS', data.customBuild.smps) : _gridEmptyItem(
                  'SMPS', 'smps'),
              data.customBuild.cabinet.isNotEmpty ? _gridItemContainer(
                  'Cabinet', data.customBuild.cabinet) : _gridEmptyItem(
                  'Cabinet', 'cabinet'),
              data.customBuild.cards.isNotEmpty ? _gridItemContainer(
                  'Cards', data.customBuild.cards) : _gridEmptyItem(
                  'Cards', 'cards'),
              data.customBuild.fans.isNotEmpty ? _gridItemContainer(
                  'Fans', data.customBuild.fans) : _gridEmptyItem(
                  'Fans', 'fans'),
              data.customBuild.others.isNotEmpty ? _gridItemContainer(
                  'Others', data.customBuild.others) : _gridEmptyItem(
                  'Others', 'others'),
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
