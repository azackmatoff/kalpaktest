import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:kalpakapp/widgets/bottom_bar.dart';

class InitialGoogleMapPage extends StatefulWidget {
  @override
  _InitialGoogleMapPageState createState() => _InitialGoogleMapPageState();
}

class _InitialGoogleMapPageState extends State<InitialGoogleMapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Map(),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
// Google Map Controller and Marker
  GoogleMapController mapController;
  static const _initialPosition = LatLng(40.523234, 72.809368);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 10.0,
              ),
              onMapCreated: onCreated,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
          ),
          Positioned(
            top: 100,
            right: 10,
            child: FloatingActionButton(
              onPressed: _onAddMarkerPressed,
              tooltip: "Add Marker",
              backgroundColor: Colors.amberAccent,
              child: Icon(Icons.add_location, color: Colors.white),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }

  void _onAddMarkerPressed() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastPosition.toString()),
          position: _lastPosition,
          infoWindow: InfoWindow(
            title: "Remember title",
            snippet: "good place",
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }
}
