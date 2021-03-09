import 'dart:convert';

import 'geometry.dart';

/// Định nghĩa nguyên mẫu tập hợp các đối tượng hình học
class GeoJSONGeometryCollection implements Geometry {
  final List<Geometry> geometries = <Geometry>[];
  GeoJSONGeometryCollection();

  @override
  GeometryType get type => GeometryType.geometryCollection;

  GeoJSONGeometryCollection.fromMap(Map data) {
    List geomsMap = data['geometries'];
    geomsMap.forEach((geomMap) {
      geometries.add(Geometry.fromMap(geomMap));
    });
  }

  @override
  double get area => 0;

  @override
  double get distance => 0;

  @override
  List<double> get bbox => [0, 0, 0, 0]; //west, south, east, north

  /// A collection of key/value pairs of geospatial data
  @override
  Map<String, dynamic> toMap() => {
        'type': 'GeometryCollection',
        'geometries': geometries.map((e) => e.toMap()).toList(),
      };

  /// A collection of key/value pairs of geospatial data as String
  @override
  String toString() {
    return jsonEncode(toMap());
  }
}
