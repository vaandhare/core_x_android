import 'dart:convert';

import 'package:core_x/api_response/prebuild_response.dart';
import 'package:core_x/pages/infoPages/prebuild_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreBuild extends StatelessWidget {
  Future<List<PreBuildResponse>> _fetchJobs() async {
    final url = 'http://10.0.2.2:3000/prebuild/getAll';
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
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PreBuildInfo()),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '${data[index].buildname}',
                    style: TextStyle(
                        fontSize: 15.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].processor}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].motherboard}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].ram}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].graphiccard}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].ssd}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '${data[index].hdd}',
                    style: TextStyle(
                        fontSize: 10.0, fontFamily: "WorkSansSemiBold"),
                  ),
                  Text(
                    '₹ ${data[index].price}',
                    style: TextStyle(
                        fontSize: 25.0, fontFamily: "WorkSansSemiBold"),
                  ),
                ],
              )),
        );
      }),
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );

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
        return CircularProgressIndicator();
      },
    );
  }
}
