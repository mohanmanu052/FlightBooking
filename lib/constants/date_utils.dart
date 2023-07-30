import 'package:intl/intl.dart';

class DateUtilsCustom {
  static String parsedate(String dateString) {
    DateTime parsingdate = DateTime.parse(dateString);
    var dateFormat = DateFormat("HH:mm").format(parsingdate);
    String convertedDate = dateFormat.toString();
    return convertedDate;
  }

  static String monthYearPares(String date) {
    DateTime parsingdate = DateTime.parse(date);
    var dateFormat = DateFormat("yyyy-MM-dd").format(parsingdate);
    String convertedDate = dateFormat.toString();
    return convertedDate;
  }

  static String timeDifference(String deprattureTime, String DestinationTime) {
    DateTime departureTimedif = DateTime.parse(deprattureTime);
    DateTime arrivingTimeDif = DateTime.parse(DestinationTime);

    var diff = arrivingTimeDif.difference(departureTimedif).inHours;

    return diff.toString();
  }
}
