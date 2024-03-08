import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/DataModel.dart';

class TypeTwoScreen extends StatefulWidget {
  const TypeTwoScreen({Key? key}) : super(key: key);

  @override
  State<TypeTwoScreen> createState() => _TypeTwoScreenState();
}

class _TypeTwoScreenState extends State<TypeTwoScreen> {
  List<DataModel> dataModel = [];

  @override
  void initState() {
    super.initState();
    getData();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataModel.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Paragraph",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                dataModel[index].report.numerologyReport.length,
                            itemBuilder: (context, subIndex) {
                              final report = dataModel[index]
                                  .report
                                  .numerologyReport[subIndex];
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      report.heading,
                                      style: TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(report.data.toString()),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
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
