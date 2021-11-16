import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String? id;
  String? name;
  String? job;
  String? createdAt;

  PostResult({this.id, this.name, this.job, this.createdAt});

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      createdAt: object['createdAt'],
    );
  }

  static Future<PostResult> postToAPI(String name, String job) async {
    Uri apiURL = Uri.parse('https://reqres.in/api/users');

    var result = await http.post(apiURL, body: {
      "name": name,
      "job": job,
    });

    var jsonObject = json.decode(result.body);

    return PostResult.createPostResult(jsonObject);
  }
}
