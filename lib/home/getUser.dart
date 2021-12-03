import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetUser extends StatefulWidget {
  GetUser({Key? key}) : super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  Map<String, dynamic>? data;

  Future<void> getSingleUser(int id) async {
    Uri uri = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      //ada data
      Map<String, dynamic> resBody = jsonDecode(response.body);
      data = resBody["data"];
    } else {
      data = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text("Flutter Minggu ke-3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data == null
                ? Text("tidak ada data")
                : Container(
                    width: 300,
                    height: 120,
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ID : ${data!['id']} "),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                "Name : ${data!['first_name']} ${data!['last_name']}"),
                            Row(
                              children: [
                                Text("Email : ${data!['email']}"),
                                SizedBox(
                                  width: 35,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage("${data!['avatar']}"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                getSingleUser(1);
              },
              child: Text("GET DATA"),
            ),
            ElevatedButton(
              onPressed: () {
                data = null;
                setState(() {});
              },
              child: Text("CLEAR DATA"),
            ),
          ],
        ),
      ),
    );
  }
}
