import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:core_x/api_response/prebuild_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreBuildInfo extends StatefulWidget {
  final String productId;

  const PreBuildInfo({Key key, this.productId}) : super(key: key);

  @override
  _PreBuildInfoState createState() => _PreBuildInfoState();
}

class _PreBuildInfoState extends State<PreBuildInfo> {
  Future<PreBuildResponse> _fetchProduct() async {
    final url = 'http://10.0.2.2:3000/prebuild/product';
    final response = await http.post(url, body: {'id': "${widget.productId}"});
    if (response.statusCode == 200) {
      return PreBuildResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  String title = "Pre-Build Product";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontFamily: "GoogleSans"),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
            color: Colors.white,
            child: FutureBuilder(
              future: _fetchProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  PreBuildResponse data = snapshot.data;
                  return productView(data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            )));
  }
}

Widget productView(PreBuildResponse data) {
  return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 200,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayCurve: Curves.decelerate,
                      enlargeCenterPage: true,
                    ),
                    itemCount: data.buildImagesURL.length,
                    itemBuilder: (BuildContext context, int intIndex) =>
                        Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            child: Image.network(
                              '${data.buildImagesURL[intIndex]}',
                              fit: BoxFit.cover,
                              height: double.infinity,
                              width: double.infinity,
                              alignment: Alignment.center,
                            )
                        ),
                  ),
                  Divider(color: Colors.deepOrangeAccent, thickness: 1),
                  Text(
                    'Specifications',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontFamily: "GoogleSans"),
                  ),
                  Divider(color: Colors.deepOrangeAccent, thickness: 1),
                  _specificationRow('Processor', '${data.processor}'),
                  _specificationRow('Motherboard', '${data.motherboard}'),
                  _specificationRow('Ram', '${data.ram}'),
                  _specificationRow('GPU', '${data.graphiccard}'),
                  _specificationRow('SSD', '${data.ssd}'),
                  _specificationRow('HDD', '${data.hdd}'),
                  _specificationRow('PSU', '${data.psu}'),
                  _specificationRow('CPU Cooler', '${data.cpucooler}'),
                  _specificationRow('OS', '${data.os}'),
                  _specificationRow('CPU Case', '${data.cpucase}'),
                  Divider(color: Colors.deepOrangeAccent, thickness: 1),
                  Text(
                    'Benchmarks',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontFamily: "GoogleSans"),
                  ),
                  Divider(color: Colors.deepOrangeAccent, thickness: 1),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: data.buildImagesURL.length,
                      itemBuilder: (context, index) {
                        return new Card(
                            child: new Container(
                                width: 180.0,
                                color: Colors.green,
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: <Widget>[
                                      Image.network(
                                        '${data.buildImagesURL[index]}',
                                        fit: BoxFit.cover,
                                        height: double.infinity,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                      ),
                                      Container(
                                        color: Colors.white.withOpacity(0.8),
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment
                                              .stretch,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .end,
                                              children: [
                                                Text(
                                                    "Game Name",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: "GoogleSans",
                                                        color: Colors.black
                                                    )
                                                ),
                                                Card(
                                                  color: Colors.deepOrange,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .all(3.0),
                                                    child: Text(
                                                        "200",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: "GoogleSans",
                                                            color: Colors.white
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ]
                                )
                            )
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Divider(color: Colors.deepOrangeAccent, thickness: 1),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white
                          )
                      ),
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                          'Buy Now',
                          style: TextStyle(
                              color: Colors.white
                          )
                      ),
                      color: Colors.deepOrange,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
  );
}


Widget _specificationRow(String title, String description) {
  return new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              '• $title :',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 15.0,
                  fontFamily: "GoogleSans"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '$description',
              maxLines: 3,
              overflow: TextOverflow.clip,
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: "GoogleSans"),
            ),
          ),
        ),
      ]
  );
}
