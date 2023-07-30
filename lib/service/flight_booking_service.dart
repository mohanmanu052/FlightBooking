import 'dart:convert';

import 'package:flight_booking/model/flight_model.dart';
import 'package:flutter/services.dart';

abstract class IFlightBookService {
  Future<dynamic> fetchFlightData();
}

class FlightBookingService implements IFlightBookService {
  @override
  Future fetchFlightData() async {
    String jsonString = await rootBundle.loadString('assets/json/flights.json');

    List<FlightModel> flights = [];

    // FlightModel modelData = FlightModel.fromJson(decodeJson);
    for (var flightData in jsonDecode(jsonString)) {
      flights.add(FlightModel.fromJson(flightData));
    }

    // TODO: implement fetchFlightData
    return flights;
  }
}
