// To parse this JSON data, do
//
//     final flightModel = flightModelFromJson(jsonString);

import 'dart:convert';

List<FlightModel> flightModelFromJson(String str) => List<FlightModel>.from(
    json.decode(str).map((x) => FlightModel.fromJson(x)));

String flightModelToJson(List<FlightModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FlightModel {
  String? id;
  String? company;
  int? points;
  int? duration;
  Segment? segment;

  FlightModel({
    this.id,
    this.company,
    this.points,
    this.duration,
    this.segment,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        id: json["id"],
        company: json["company"],
        points: json["points"],
        duration: json["duration"],
        segment:
            json["segment"] == null ? null : Segment.fromJson(json["segment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "points": points,
        "duration": duration,
        "segment": segment?.toJson(),
      };
}

class Segment {
  int? duration;
  int? price;
  DateTime? date;
  String? departureTime;
  String? arrivalTime;
  String? origin;
  String? destination;
  int? connectionDuration;

  Segment({
    this.duration,
    this.price,
    this.date,
    this.departureTime,
    this.arrivalTime,
    this.origin,
    this.destination,
    this.connectionDuration,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        duration: json["duration"],
        price: json["price"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        departureTime: json["departureTime"],
        arrivalTime: json["arrivalTime"],
        origin: json["origin"],
        destination: json["destination"],
        connectionDuration: json["connectionDuration"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "price": price,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "origin": origin,
        "destination": destination,
        "connectionDuration": connectionDuration,
      };
}
