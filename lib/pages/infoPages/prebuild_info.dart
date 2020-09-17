import 'dart:convert';

import 'package:core_x/api_response/prebuild_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreBuildInfo extends StatelessWidget {
  Future<PreBuildResponse> _fetchJobs() async {
    final url = 'http://10.0.2.2:3000/prebuild/getAll';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 200.0,
          ),
          Text(
            'Just another PC',
            style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
