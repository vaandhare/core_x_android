import 'dart:convert';

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
          title: Text(title),
          backgroundColor: Colors.deepOrange,
        ),
        body: Container(
            color: Colors.white,
            child: Container(
              child: FutureBuilder(
                future: _fetchProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    PreBuildResponse data = snapshot.data;
                    // setState(() {
                    //   title = data.buildname;
                    // });
                    return productView(data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Specifications',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.deepOrange,
                          fontFamily: "WorkSansSemiBold"),
                    ),
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Processor',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.processor}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Motherboard',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.motherboard}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Ram',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.ram}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'GPU',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.graphiccard}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'SSD',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.ssd}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'HDD',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.hdd}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'PSU',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.psu}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'CPU Cooler',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.cpucooler}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'OS',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.os}'),
                            ],
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'CPU Case',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontSize: 16.0,
                                    fontFamily: "WorkSansSemiBold"),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Stack(
                            children: <Widget>[
                              Text('${data.cpucase}'),
                            ],
                          ),
                        ),
                      ]),
                    ],
                  ),
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
