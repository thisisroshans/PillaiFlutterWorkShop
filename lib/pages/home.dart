import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:PillaiFlutter/model/records.dart';

class HomePage extends StatefulWidget {
  final Future<http.Response> response;
  HomePage({Key key, this.response}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
Future<DelhiRecords> data;
Future<DelhiRecords> fetchLaunchess() async {
  final response = await http.get(
      'https://api.data.gov.in/resource/c4db89c0-02b3-4401-bbd2-ca2fe03b811e?api-key=579b464db66ec23bdd000001cdd3946e44ce4aad7209ff7b23ac571b&format=json');
  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    print(response.body);
    return DelhiRecords.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Roshan Workshop'),
          textTheme: TextTheme(
            title: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
      body: Container(
          child: FutureBuilder<DelhiRecords>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return cityCard(context, snapshot.data.records[0]);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    data = fetchLaunchess();
  }
}

Widget cityCard(BuildContext context, Records records) {
  Card card;
  card = new Card(
    child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'City Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.cityName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Zone Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.zoneName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Ward Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.wardName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'No. of Poles',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.numberOfPoles.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'No. of Poles (LED)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.noOfPolesOfLedBulbs.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'No. of Poles(Conventional)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.noOfPolesWithConventionalNonLedLights.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total Length of Road(KM)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.totalLengthOfRoadsInKm.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Street Light Poles per KM',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.numberOfStreetLightsPolesPerKmOfRoad.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total No of Streets',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.totalNoOfStreets.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total No of Streets with adequate\nStreet Light Poles',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(records.noOfStreetsWithAdequateStreetLightingFacilties.toString()),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  return card;
}
