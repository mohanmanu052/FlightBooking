import 'package:flight_booking/model/flight_model.dart';
import 'package:flutter/material.dart';

enum SerachResultState { LOADING, EMPTY, ERROR, SUCESS }

class FlightSearchController extends ChangeNotifier {
  List<FlightModel> searchResults = [];
  SerachResultState searchSate = SerachResultState.LOADING;

  Future<dynamic> serachUserFligthInputdata(List<FlightModel> flightList,
      String departureLocation, String ArraivalLocation, String date) async {
    searchResults.clear();
    DateTime parsedDate = DateTime.parse(date);

    for (FlightModel data in flightList) {
      if (data.segment!.origin == departureLocation &&
          data.segment!.destination == ArraivalLocation &&
          data.segment?.date == parsedDate) {
        searchResults.add(data);
      }
    }
    if (searchResults != null && searchResults.isNotEmpty) {
      searchSate = SerachResultState.SUCESS;
    } else {
      searchSate = SerachResultState.EMPTY;
    }
    notifyListeners();
    return searchResults;
  }
}
