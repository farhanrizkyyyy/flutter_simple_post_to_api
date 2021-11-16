// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:latihan_integrasi_api/post_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _title = 'Flutter API Integration';

  PostResult? postResult;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Response:'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    (postResult != null)
                        ? postResult!.id! +
                            ' | ' +
                            postResult!.name! +
                            ' | ' +
                            postResult!.job! +
                            ' | ' +
                            postResult!.createdAt!
                        : 'Data kosong',
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  PostResult.postToAPI('Farhan', 'Tidur').then(
                    (value) {
                      log("$value");
                      setState(() {
                        postResult = value;
                      });
                    },
                  );
                },
                child: Text('POST'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
