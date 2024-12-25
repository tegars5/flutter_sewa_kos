import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_app/pages/models/space.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpaces() async {
    var result =
        await http.get(Uri.parse('https://bwa-cozy-api-i9vx.vercel.app'));

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
