import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/DataModel.dart';
import 'package:practice/fruitsModel.dart';

class TypeOneScreen extends StatefulWidget {
  const TypeOneScreen({Key? key}) : super(key: key);

  @override
  State<TypeOneScreen> createState() => _TypeOneScreenState();
}

class _TypeOneScreenState extends State<TypeOneScreen> {
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
          : ListView.builder(
              itemCount: dataModel.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  height: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${dataModel[index].report.favourablePoints[index].heading} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Text(
                          "Name: ${dataModel[index].report.favourablePoints[index].data.name} "),
                      Text(
                          "Date of Birth: ${dataModel[index].report.favourablePoints[index].data.dateOfBirth} "),
                      Text(
                          "Destiny Number: ${dataModel[index].report.favourablePoints[index].data.destinyNumber} "),
                      Text(
                          "Radical Number: ${dataModel[index].report.favourablePoints[index].data.radicalNumber} "),
                      Text(
                          "Name Number: ${dataModel[index].report.favourablePoints[index].data.nameNumber}  "),
                      Text(
                          "Evil Number: ${dataModel[index].report.favourablePoints[index].data.evilNumber}"),
                      Text(
                          "Favourite Colour: ${dataModel[index].report.favourablePoints[index].data.favouriteColour} "),
                      Text(
                          "Favourite Day: ${dataModel[index].report.favourablePoints[index].data.favouriteDay} "),
                      Text(
                          "Favourite God: ${dataModel[index].report.favourablePoints[index].data.favouriteGod}"),
                      Text(
                          "Favourite Mantra: ${dataModel[index].report.favourablePoints[index].data.favouriteMantra} "),
                      Text(
                          "Favourite Metal: ${dataModel[index].report.favourablePoints[index].data.favouriteMetal} "),
                      Text(
                          "Favourite Stone: ${dataModel[index].report.favourablePoints[index].data.favouriteStone} "),
                      Text(
                          "Favourite Substones: ${dataModel[index].report.favourablePoints[index].data.favouriteSubstones}"),
                      Text(
                          "friendly Numbers: ${dataModel[index].report.favourablePoints[index].data.friendlyNumbers} "),
                      Text(
                          "Neutral Number:  ${dataModel[index].report.favourablePoints[index].data.neutralNumber}"),
                      Text(
                          "Radical Ruler: ${dataModel[index].report.favourablePoints[index].data.radicalRuler}"),

                      // Text(Fruit.fruitsList[index].price.toString())
                    ],
                  ),
                );
              },
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
        var jsonData = jsonDecode(response.body.toString());
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
