
import 'package:first_app/interfacevariable/editable.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:first_app/models/LongCar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import "package:eventsource/eventsource.dart";
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editable example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Create a Key for EditableState
  final _editableKey = GlobalKey<EditableState>();


  @override
  void initState() {
    super.initState();
    connectEvent();
    fetchData();
  }



  

  Future<List<LongCar>> fetchData() async {
  var url = Uri.parse('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    print(response.body);
    return jsonResponse.map((data) => LongCar.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}



   
   
  List<LongCar> rows = [
    // {
    //   "Name": 'Consommation de carburant',
    //   "Valeur": '46.5',
    //   "Impérial": 'L',
    //   "Métrique": 'completed'
    // },
    // {
    //   "Name": 'Niveau de carburant instantane',
    //   "Valeur": '62.5',
    //   "Impérial": 'L',
    //   "Métrique": 'completed'
    // },
    // {
    //  "Name": 'Resistance jauge a carburant ',
    //   "Valeur": '49.7',
    //   "Impérial": 'L',
    //   "Métrique": 'completed'
    // },
  
  ];


  void connectEvent() async{

     EventSource eventSource =
      await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking");
  // listen for events
  eventSource.listen((Event event) {
    print("New event:");
    print("  event: ${event.event}");
    print("  data: ${event.data}");
   LongCar jsonResponse = json.decode(event.data.toString())['body'];
   
     rows.add(jsonResponse);
     setState(() {
            rows.add(jsonResponse);
          });
          _addNewRow();
  });

  }

   

  List cols = [
    {"title": 'Name', 'widthFactor': 0.2, 'key': 'name', 'Name': false},
    {"title": 'Valeur', 'widthFactor': 0.2, 'key': 'Valeur'},
    {"title": 'Impérial', 'widthFactor': 0.2, 'key': 'Impérial'},
    {"title": 'Métrique', 'key': 'Métrique'},
  ];

  /// Function to add a new row
  /// Using the global key assigined to Editable widget
  /// Access the current state of Editable
  void _addNewRow() {
    setState(() {
      _editableKey.currentState! .createRow();
    });
  }

  ///Print only edited rows.
  void _printEditedRows() {
    List editedRows = _editableKey.currentState!.editedRows;
    print(editedRows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: TextButton.icon(
            onPressed: () => _addNewRow(),
            icon: Icon(Icons.add),
            label: Text(
              'Add',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        title: Text("table"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () => _printEditedRows(),
                child: Text('Print Edited Rows',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: Editable(
        key: _editableKey,
        columns: cols,
        rows: rows,
        zebraStripe: true,
        stripeColor1: Colors.blue,
        stripeColor2: Colors.white,
        onRowSaved: (value) {
          print(value);
        },
        onSubmitted: (value) {
          print(value);
        },
        borderColor: Colors.blueGrey,
        tdStyle: TextStyle(fontWeight: FontWeight.bold),
        trHeight: 80,
        thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        thAlignment: TextAlign.center,
        thVertAlignment: CrossAxisAlignment.end,
        thPaddingBottom: 3,
        showSaveIcon: true,
        saveIconColor: Colors.black,
        showCreateButton: true,
        tdAlignment: TextAlign.left,
        tdEditableMaxLines: 100, // don't limit and allow data to wrap
        tdPaddingTop: 0,
        tdPaddingBottom: 14,
        tdPaddingLeft: 10,
        tdPaddingRight: 8,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(0))),
      ),
    );
  }
}