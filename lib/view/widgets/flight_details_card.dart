import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flight_booking/constants/date_utils.dart';
import 'package:flight_booking/model/flight_model.dart';
import 'package:flight_booking/reusable/reusable_button.dart';
import 'package:flight_booking/view/check_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlightDetailsCard extends StatelessWidget {
  FlightDetailsCard({super.key, this.flightData});
  FlightModel? flightData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        flightData?.company ?? '',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: CustomColors.blue1),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Text(
                      flightData?.id ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Text(
                        '${DateUtilsCustom.timeDifference(flightData?.segment?.departureTime ?? '', flightData?.segment?.arrivalTime ?? '')} Hours',
                        textAlign: TextAlign.right,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.grey, fontSize: 13),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _timeFlightColumn(
                      context,
                      DateUtilsCustom.parsedate(
                          flightData?.segment?.departureTime ?? ''),
                      flightData?.segment?.origin ?? ''),
                  SvgPicture.asset('assets/svgs/aroplane_line.svg'),
                  _timeFlightColumn(
                      context,
                      DateUtilsCustom.parsedate(
                          flightData?.segment?.arrivalTime ?? ''),
                      flightData?.segment?.destination ?? ''),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Business Class',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: CustomColors.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w300)),
                    Text('₹ ${flightData?.segment?.price.toString()}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600))
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            ReUsableButton(
              buttonText: 'Check',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CheckInView(
                              flightData: flightData,
                            )));
              },
              width: 400,
            )
          ],
        ),
      ),
    );
  }

  Widget _timeFlightColumn(BuildContext context, String time, String location) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              time ?? '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Text(
            location ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
