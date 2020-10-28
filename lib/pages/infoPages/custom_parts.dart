import 'dart:convert';

import 'package:core_x/api_response/custom_parts_response.dart';
import 'package:core_x/api_response/user_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomParts extends StatefulWidget {
  final String type;
  final String title;
  final String userId;

  const CustomParts({Key key, this.type, this.title, this.userId})
      : super(key: key);

  @override
  _CustomPartsState createState() => _CustomPartsState();
}

class _CustomPartsState extends State<CustomParts> {
  Future<List<CustomPartsResponse>> _fetchParts() async {
    final url = 'http://10.0.2.2:3000/custom/${widget.type}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((list) => new CustomPartsResponse.fromJson(list))
          .toList();
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<CustomPartsResponse> _fetchProduct(productId) async {
    final url = 'http://10.0.2.2:3000/custom/getProduct';
    final response = await http.post(url, body: {'id': productId});

    if (response.statusCode == 200) {
      return CustomPartsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<UserResponse> _findUser() async {
    final url = 'http://10.0.2.2:3000/users/findUser';
    final response = await http.post(url, body: {'id': "${widget.userId}"});

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  Future<UserResponse> _updatePrice(productId) async {
    final url = 'http://10.0.2.2:3000/users/update${widget.type}';
    final response = await http.post(url, body: {
      'id': "${widget.userId}",
      '${widget.type}': productId,
      'price': '000'
    });

    if (response.statusCode == 200) {
      return UserResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontFamily: "GoogleSans"),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: FutureBuilder<List<CustomPartsResponse>>(
          future: _fetchParts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CustomPartsResponse> data = snapshot.data;
              return _showcaseProducts(data, context);
            } else if (snapshot.data == null ||
                snapshot.data.length == 0 ||
                snapshot.data.isEmpty) {
              return Container(
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text(
                  'No data found',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              );
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
        ));
  }

  ListView _showcaseProducts(data, context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                    onTap: () {
                      _productDialog(data[index], context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${data[index].title}',
                              style: TextStyle(
                                  fontSize: 14.0, fontFamily: "GoogleSans"),
                            ),
                            Text(
                              '₹ ${data[index].price}',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: "GoogleSans",
                                  color: Colors.deepOrange[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))),
              ),
            ),
          );
        });
  }

  _productDialog(data, BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(20, 50, 20, 50),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Model No: ${data.modelNumber}',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Description :',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    data.description,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    '₹${data.price}',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _updatePrice(data.sId);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Add to your Custom-build',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }
}
