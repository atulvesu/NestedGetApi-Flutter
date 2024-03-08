import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/DataModel.dart';

class TypeThreeScreen extends StatefulWidget {
  const TypeThreeScreen({super.key});

  @override
  State<TypeThreeScreen> createState() => _TypeThreeScreenState();
}

class _TypeThreeScreenState extends State<TypeThreeScreen> {
  @override
  List<DataModel> dataModel = [];

  @override
  void initState() {
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: dataModel.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dataModel.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Key Paragraph"),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              dataModel[index].report.ascendantReport.length,
                          itemBuilder: (context, subIndex) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      child: Text(dataModel[index]
                                          .report
                                          .ascendantReport[index]
                                          .heading)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(dataModel[index]
                                      .report
                                      .ascendantReport[index]
                                      .data
                                      .report),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "People with Aries rising tend to be energetic, pioneering, rash, argumentative, selfish, impulsive, quick-tempered,"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          })
                    ],
                  ),
                );
              }),
    );
  }

  Future<void> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://harpreetcd.github.io/reactnative.json'));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);

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
