import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(
      39.9251281,
      32.8276288,
    ),
    zoom: 10,
  );

  var markers = <Marker>{
    const Marker(
      markerId: MarkerId('Ekovar Recycling'),
      position: LatLng(39.9283873, 32.7209444),
    ),
    const Marker(
      markerId: MarkerId('Zirve Geri Donusum'),
      position: LatLng(
        39.9544423,
        32.7783844,
      ),
    ),
    const Marker(
      markerId: MarkerId('Recycle Center Ankara'),
      position: LatLng(
        39.9544423,
        32.7783844,
      ),
    ),
    const Marker(
      markerId: MarkerId('Pelkar Recycle'),
      position: LatLng(
        39.9730585,
        32.6125515,
      ),
    ),
    const Marker(
      markerId: MarkerId('Hak Metal Recycle'),
      position: LatLng(
        39.9593191,
        32.731822,
      ),
    ),
    const Marker(
      markerId: MarkerId('Tugra Recycle'),
      position: LatLng(
        39.9593191,
        32.731822,
      ),
    ),
    const Marker(
      markerId: MarkerId('Kor Plast Recycle'),
      position: LatLng(
        39.9711917,
        32.7049218,
      ),
    ),
    const Marker(
      markerId: MarkerId('ATABEY Recycle'),
      position: LatLng(
        39.9711917,
        32.7049218,
      ),
    ),
    const Marker(
      markerId: MarkerId('MORKAYA Recycle'),
      position: LatLng(
        39.9711917,
        32.7049218,
      ),
    ),
    const Marker(
      markerId: MarkerId('MElemental Geri Dönüşüm - Ankara Bölge Ofisi'),
      position: LatLng(
        39.9711917,
        32.7049218,
      ),
    ),
    const Marker(
      markerId: MarkerId('TUNSA'),
      position: LatLng(
        39.9684009,
        32.7034652,
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          () => EagerGestureRecognizer(),
        ),
      },
      markers: markers,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
