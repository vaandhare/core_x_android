import 'dart:convert';

import 'package:core_x/api_response/usershowcase_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserShowcase extends StatelessWidget {
  Future<List<UserShowcaseResponse>> _fetchJobs() async {
    final url = 'http://10.0.2.2:3000/usershowcase/getAll';
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
            child: Card(
              shadowColor: Colors.black,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) =>
                    //         PreBuildInfo(productId: '${data[index].sId}',)),
                    // );
                  },
                  child: Container(
                      child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            imageURL('${data[index].thumbnailURL}'),
                            Text(
                              '₹ ${data[index].price}',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontFamily: "WorkSansSemiBold",
                                  color: Colors.deepOrange),
                            ),
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
                              '${data[index].buildname}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: "WorkSansSemiBold"),
                            ),
                            Text(
                              'Customer: ${data[index].customername}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].processor}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].motherboard}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].ram}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].ssd}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].hdd}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                            Text(
                              '${data[index].graphiccard}',
                              style: TextStyle(
                                  fontSize: 15.0, fontFamily: "WorkSansMedium"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
            ),
          );
        });
  }

  Widget imageURL(String url) {
    try {
      return new Image.network(url,
          height: 150.0, width: 150.0, fit: BoxFit.cover);
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
        return CircularProgressIndicator();
      },
    );
  }
}
