import 'package:flight_booking/model/flight_model.dart';
import 'package:flight_booking/service/flight_booking_service.dart';
import 'package:flutter/material.dart';

enum FlightStatus { LOADING, SUCCESS, EMPTY, ERROR }

class FlightBookingController extends ChangeNotifier
    implements IFlightBookService {
  FlightStatus status = FlightStatus.LOADING;
  List<FlightModel> flightData = [];
  FlightBookingService _bookingService = FlightBookingService();
  TextEditingController dateController = TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != dateController.text) {
      dateController.text = pickedDate.toString().split(' ')[0];
      notifyListeners();
    }
  }

  @override
  Future fetchFlightData() async {
    flightData = await _bookingService.fetchFlightData();
    if (flightData != null && flightData!.isNotEmpty) {
      status = FlightStatus.SUCCESS;
      notifyListeners();
    } else {
      status = FlightStatus.EMPTY;
      notifyListeners();
    }
    return flightData;
  }
}
