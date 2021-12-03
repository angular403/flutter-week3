import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text("Flutter Minggu ke-3"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id :"),
                      Text("Nama :"),
                      Text("Email :"),
               
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
