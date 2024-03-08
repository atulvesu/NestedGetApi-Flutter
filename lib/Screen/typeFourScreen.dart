import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/DataModel.dart';

class TypeFourScreen extends StatefulWidget {
  const TypeFourScreen({Key? key}) : super(key: key);

  @override
  State<TypeFourScreen> createState() => _TypeFourScreenState();
}

class _TypeFourScreenState extends State<TypeFourScreen> {
  List<DataModel> dataModel = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataModel.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  for (var model in dataModel)
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Table"),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            itemCount: model.houseCuspsAndSandhi.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final houseCuspAndSandhi =
                                  model.houseCuspsAndSandhi[index];
                              return Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      houseCuspAndSandhi.heading,
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    for (var data in houseCuspAndSandhi.data)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("House : ${data.house}"),
                                          Text("Degree : ${data.degree}"),
                                          Text("Sign : ${data.sign}"),
                                          Text("Sign Lord : ${data.signLord}"),
                                          Text(
                                              "Start Lord : ${data.startLord}"),
                                          Text("Sub Lord : ${data.subLord}"),
                                          SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://harpreetcd.github.io/reactnative.json'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        setState(() {
          dataModel.add(DataModel.fromJson(jsonData));
        });
      } else {
        print("Data Not found");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
