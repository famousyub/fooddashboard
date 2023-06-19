import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';

void main5() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // can create a controller, and call methods to update source loc,
  // destination loc, interact with the google maps controller to
  // show/hide markers programmatically etc.
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: GoogleMapsWidget(
                  apiKey: "AIzaSyD7fSvAPIz-31x_pMPJ3hR3xMcP8WjJxJ0",
                  key: mapsWidgetController,
                  sourceLatLng: LatLng(
                    40.484000837597925,
                    -3.369978368282318,
                  ),
                  destinationLatLng: LatLng(
                    40.48017307700204,
                    -3.3618026599287987,
                  ),

                  ///////////////////////////////////////////////////////
                  //////////////    OPTIONAL PARAMETERS    //////////////
                  ///////////////////////////////////////////////////////

                  routeWidth: 2,
                  sourceMarkerIconInfo: MarkerIconInfo(
                    infoWindowTitle: "This is source name",
                    onTapInfoWindow: (_) {
                      print("Tapped on source info window");
                    },
                    assetPath: "assets/images/house-marker-icon.png",
                  ),
                  destinationMarkerIconInfo: MarkerIconInfo(
                    assetPath: "assets/images/restaurant-marker-icon.png",
                  ),
                  driverMarkerIconInfo: MarkerIconInfo(
                    infoWindowTitle: "Alex",
                    assetPath: "assets/images/driver-marker-icon.png",
                    onTapMarker: (currentLocation) {
                      print("Driver is currently at $currentLocation");
                    },
                    assetMarkerSize: Size.square(125),
                    rotation: 90,
                  ),
                  updatePolylinesOnDriverLocUpdate: true,
                  onPolylineUpdate: (_) {
                    print("Polyline updated");
                  },
                  // mock stream
                  driverCoordinatesStream: Stream.periodic(
                    Duration(milliseconds: 500),
                    (i) => LatLng(
                      40.47747872288886 + i / 10000,
                      -3.368043154478073 - i / 10000,
                    ),
                  ),
                  totalTimeCallback: (time) => print(time),
                  totalDistanceCallback: (distance) => print(distance),
                ),
              ),
              // demonstrates how to interact with the controller
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          mapsWidgetController.currentState!.setSourceLatLng(
                            LatLng(
                              40.484000837597925 * (Random().nextDouble()),
                              -3.369978368282318,
                            ),
                          );
                        },
                        child: Text('Update source'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final googleMapsCon = await mapsWidgetController
                              .currentState!
                              .getGoogleMapsController();
                          googleMapsCon.showMarkerInfoWindow(
                            MarkerIconInfo.sourceMarkerId,
                          );
                        },
                        child: Text('Show source info'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}