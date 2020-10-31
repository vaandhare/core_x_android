import 'dart:convert';

import 'package:core_x/api_response/prebuild_response.dart';
import 'package:core_x/pages/infoPages/prebuild_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreBuild extends StatelessWidget {
  Future<List<PreBuildResponse>> _fetchJobs() async {
    final url = 'https://corexapi.herokuapp.com/prebuild/getAll';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((list) => new PreBuildResponse.fromJson(list))
          .toList();
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  GridView _jobsListView(data, context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(data.length, (index) {
        return Container(
          child: Card(
            shadowColor: Colors.black,
            color: Colors.white70,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => PreBuildInfo(
                            productId: '${data[index].sId}',
                          )),
                );
              },
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: imageURL('${data[index].thumnailurl}'),
                  ),
                  Text(
                    '${data[index].buildname}',
                    style: TextStyle(
                        fontSize: 12.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '₹ ${data[index].price}',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "WorkSansSemiBold",
                        color: Colors.deepOrange),
                  ),

                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget imageURL(String url) {
    try {
      return new Image.network(
          url,
          height: 125.0,
          width: 125.0,
          fit: BoxFit.cover
      );
    } catch (e) {
      return Icon(Icons.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PreBuildResponse>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PreBuildResponse> data = snapshot.data;
          return _jobsListView(data, context);
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
