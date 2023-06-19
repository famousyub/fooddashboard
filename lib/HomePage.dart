import 'dart:async';
import 'dart:ffi';
import 'package:first_app/models/LongCar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import "package:eventsource/eventsource.dart";
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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




class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final  List<LongCar> _events = [];

  @override
  void initState() {
    super.initState();
    _connectToEventSource();
    fetchData();
  }

   void _connectToEventSource2() async {
   // try {
     // final response = await http.get(Uri.parse('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking'));

  
        /*final eventSource = html.EventSource('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking');
      
        eventSource.onMessage.listen((event) {
          setState(() {
            _events.add(event.data);
          });
        });

        eventSource.onError.listen((error) {
          print('Error: event ');
        });
      
    } catch (e) {
      print('Error: $e');
    }

    */


    EventSource eventSource =
      await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking");
  // listen for events
  eventSource.listen((Event event) {
    print("New event:");
    print("  event: ${event.event}");
    print("  data: ${event.data}");
   LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
     setState(() {
            _events.add(jsonResponse);
          });
  });

  //print(_events.length);

  // If you know the last event.id from a previous connection, you can try this:

  String lastId = "lm";
  eventSource = await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking",
      lastEventId: lastId);
  // listen for events
  eventSource.listen((Event event) {
    //print("New event:");
    //print("  event: ${event.event}");
    //print("  data: ${event.data}");
    setState(() {
      LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
        
          });
   //  _events.add(event);
      //print(_events.length);
  });
  
  }


  Future<List<LongCar>>  _connectToEventSource() async {
   // try {
     // final response = await http.get(Uri.parse('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking'));

  
        /*final eventSource = html.EventSource('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking');
      
        eventSource.onMessage.listen((event) {
          setState(() {
            _events.add(event.data);
          });
        });

        eventSource.onError.listen((error) {
          print('Error: event ');
        });
      
    } catch (e) {
      print('Error: $e');
    }

    */


    EventSource eventSource =
      await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking");
  // listen for events
  eventSource.listen((Event event) {
    print("New event:");
    print("  event: ${event.event}");
    print("  data: ${event.data}");
   LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
     setState(() {
            _events.add(jsonResponse);
          });
  });

  //print(_events.length);

  // If you know the last event.id from a previous connection, you can try this:

  String lastId = "lm";
  eventSource = await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking",
      lastEventId: lastId);
  // listen for events
  eventSource.listen((Event event) {
    //print("New event:");
    //print("  event: ${event.event}");
    //print("  data: ${event.data}");
    setState(() {
      LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
        
          });
   //  _events.add(event);
      //print(_events.length);
  });
  return _events;
  }



  @override
  Widget build(BuildContext context) {
    return 
    
    
    FutureBuilder<List<LongCar>>(
      future: _connectToEventSource(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 75,
                  color: Color.fromARGB(255, 99, 112, 25),
                  child: Center(
                    child: Text("title:   ${snapshot .data![index].latitude} +  id :  + ${snapshot.data![index].latitude.toString()}"),
                    
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}






class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);

@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


final  List<LongCar> _events = [];
 final List<Marker> _markers1 = <Marker>[];

 final List<CameraPosition> composition = <CameraPosition>[];


  
  CameraPosition? cameraPosition;
  @override
   void  initState()  {
    super.initState();
     _connectToEventSource();
  }


  Future<List<LongCar>>  _connectToEventSource() async {
   


    EventSource eventSource =
      await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking");
  // listen for events
  eventSource.listen((Event event) {
    print("New event:");
    print("  event: ${event.event}");
    print("  data: ${event.data}");
  
   //String jsonResponse = json.decode(event.data!);

   LongCar cr =  LongCar.fromJson(json.decode(event.data!));
  print ("/////");
 
   print(cr.longitude);
     _events.add(cr);
    


print ("///////////");

print(cr.latitude);

  cameraPosition=  new CameraPosition(
			target: LatLng(double.parse( cr.latitude), double.parse(cr.longitude)),
			zoom: 14,
			);

       


          
			
      
           
         

print(_markers1.length);

setState(() {

  composition.add(cameraPosition!);
            _events.add(cr);

              _markers1.add (
	Marker(
		markerId: MarkerId('1'),
	position: LatLng(double.parse( cr.latitude), double.parse( (cr.longitude))),
	infoWindow: InfoWindow(
		title: 'My Position',
	)
),
);



          });


           

  });

  //print(_events.length);

  // If you know the last event.id from a previous connection, you can try this:

  String lastId = "lm";
  eventSource = await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking",
      lastEventId: lastId);
  // listen for events
  eventSource.listen((Event event) {
    //print("New event:");
    //print("  event: ${event.event}");
    //print("  data: ${event.data}");
   /* setState(() {
      var  jsonResponse = json.decode(event.data.toString());
      print(jsonResponse);
     _events.add(jsonResponse);
        
          });*/
   //  _events.add(event);
      //print(_events.length);
  });


  
  return _events;
  }






Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
static final CameraPosition _kGoogle2 = const CameraPosition(
	target: LatLng(20.42796133580664, 80.885749655962),
	zoom: 14.4746,
);

// on below line we have created the list of markers





 void _connectToEventSource2(CameraPosition cam) async {
   // try {
     // final response = await http.get(Uri.parse('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking'));

  
        /*final eventSource = html.EventSource('http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking');
      
        eventSource.onMessage.listen((event) {
          setState(() {
            _events.add(event.data);
          });
        });

        eventSource.onError.listen((error) {
          print('Error: event ');
        });
      
    } catch (e) {
      print('Error: $e');
    }

    */


    EventSource eventSource =
      await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking");
  // listen for events
  eventSource.listen((Event event) {
    print("New event:");
    print("  event: ${event.event}");
    print("  data: ${event.data}");
   LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
     setState(() {
            _events.add(jsonResponse);
          });
  });

  //print(_events.length);

  // If you know the last event.id from a previous connection, you can try this:

  String lastId = "lm";
  eventSource = await EventSource.connect("http://35.180.211.234:1111/api/cubeIT/NaviTrack/rest/device/stream/tracking",
      lastEventId: lastId);
  // listen for events
  eventSource.listen((Event event) {
    //print("New event:");
    //print("  event: ${event.event}");
    //print("  data: ${event.data}");
    setState(() {
      LongCar jsonResponse = json.decode(event.data.toString())['body'];
     _events.add(jsonResponse);
        
          });
   //  _events.add(event);
      //print(_events.length);
  });
 
  }


 



// created method for getting user current location
Future<Position> getUserCurrentLocation() async {



	await Geolocator.requestPermission().then((value){
	}).onError((error, stackTrace) async {
	await Geolocator.requestPermission();
	print("ERROR"+error.toString());
	});
	return await Geolocator.getCurrentPosition();
  
}

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		backgroundColor: Color.fromARGB(255, 51, 157, 15),
		// on below line we have given title of app
		title: Text("mapcar  ${_markers1.length}  ${composition.length}"),
	),
	body: Container(
		child: SafeArea(
		// on below line creating google maps
		child: GoogleMap(
		// on below line setting camera position
		initialCameraPosition: _kGoogle2,
		// on below line we are setting markers on the map
		markers: Set<Marker>.of(_markers1),
		// on below line specifying map type.
		mapType: MapType.normal,
		// on below line setting user location enabled.
		myLocationEnabled: true,
		// on below line setting compass enabled.
		compassEnabled: true,
    
		// on below line specifying controller on map complete.
		onMapCreated: (GoogleMapController controller){
				_controller.complete(controller);
			},
		),
		),
	),
	// on pressing floating action button the camera will take to user current location
	floatingActionButton: FloatingActionButton(
		onPressed: () async{
List<LongCar> cars= 	await  _connectToEventSource();

          
          print (cars.length);





  CameraPosition cameraPosition=  new CameraPosition(
			target: LatLng(double.parse( cars[0].latitude), double.parse(cars[0].longitude)),
			zoom: 14,
			);

        cars.forEach(((element) => {

          	
			
        cameraPosition = new CameraPosition(
			target: LatLng(double.parse( element.latitude), double.parse(element.longitude)),
			zoom: 14,
			),
           // _markers1.add(
			// 	Marker(
			// 	markerId: MarkerId("2"),
			// 	position: LatLng(double.parse( element.latitude), double.parse(element.longitude)),
			// 	infoWindow: InfoWindow(
			// 		title: 'My Current Location',
			// 	),
			// 	)
      // )
      }));

      print(_markers1[0].position.latitude);
			print(cars[0].latitude + "  longggg  *********** "+cars[0].longitude.toString());

			// marker added for current users location
		

			// specified current users location
			CameraPosition cameraPosition1 = new CameraPosition(
			target: LatLng(double.parse( cars[0].latitude), double.parse(cars[0].longitude)),
			zoom: 14,
			);

			final GoogleMapController controller = await _controller.future;

      composition.forEach((element) {
        controller.animateCamera(CameraUpdate.newCameraPosition(element));
			//controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
			setState(() {
            _connectToEventSource();
             _connectToEventSource2(_kGoogle2);

			});
        
      });
controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition1));
			//controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
			setState(() {
            _connectToEventSource();
            _connectToEventSource2(cameraPosition1);

			});




     
            _connectToEventSource().then((value) async {
              
print ("*************************");
print(value[0].longitude);


      
		});

  

		},
		child: Icon(Icons.local_activity),
	),
	);
}
}
