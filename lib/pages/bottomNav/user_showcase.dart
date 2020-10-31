import 'dart:convert';

import 'package:core_x/api_response/usershowcase_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserShowcase extends StatelessWidget {
  Future<List<UserShowcaseResponse>> _fetchJobs() async {
    final url = 'https://corexapi.herokuapp.com/usershowcase/getAll';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((list) => new UserShowcaseResponse.fromJson(list))
          .toList();
    } else {
      throw Exception('Failed to load data from API');
    }
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
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) =>
                      //         PreBuildInfo(productId: '${data[index].sId}',)),
                      // );
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  imageURL('${data[index].thumbnailURL}'),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '#${data[index].orderID}',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: "GoogleSans"),
                                  ),
                                  Text(
                                    '${data[index].buildname}',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: "GoogleSans"),
                                  ),
                                  Text(
                                    'Customer: ${data[index].customername}',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: "GoogleSans"),
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
                              ),
                            )
                          ],
                        ))),
              ),
            ),
          );
        });
  }

  Widget imageURL(String url) {
    try {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Image.network(
          url,
          height: 80.0,
          width: 80.0,
          fit: BoxFit.cover,
        ),
      );
    } catch (e) {
      return Icon(Icons.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserShowcaseResponse>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<UserShowcaseResponse> data = snapshot.data;
          return _showcaseProducts(data, context);
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
    );
  }
}
