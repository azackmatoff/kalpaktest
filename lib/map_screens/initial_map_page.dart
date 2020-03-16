import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  GoogleMapController mapController;
  static const _initialPosition = LatLng(40.523234, 72.809368);
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          GoogleMap(
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
          Positioned(
            top: 40,
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
      _markers.add(Marker(markerId: MarkerId(_lastPosition.toString()),
      position: _lastPosition,
      infoWindow: InfoWindow(
        title: "Remember title",
        snippet: "good place",
      ),
      icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
