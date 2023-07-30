import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flight_booking/constants/date_utils.dart';
import 'package:flight_booking/custom_input_decoration.dart';
import 'package:flight_booking/model/flight_model.dart';
import 'package:flight_booking/reusable/outline_reusable_button.dart';
import 'package:flight_booking/reusable/reusable_button.dart';
import 'package:flight_booking/view/flight_booking_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckInView extends StatelessWidget {
  const CheckInView({super.key, this.flightData});
  final FlightModel? flightData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flight Details'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          flightData?.company ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: CustomColors.blue1),
                        ),
                      ),
                      const Divider(),
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
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: TextFormField(
                                    initialValue:
                                        DateUtilsCustom.monthYearPares(
                                            flightData?.segment?.date
                                                    .toString() ??
                                                ""),
                                    readOnly:
                                        true, // Make the text field read-only
                                    onTap: () {
                                      // controller?.selectDate(
                                      //     context); // Show the date picker on tap
                                    },
                                    decoration: CustomInputDecoration(
                                            isLabelText: true,
                                            labelText: 'Date',
                                            isCalender: false,
                                            isPrefixIcon: false,
                                            isSvgPictiureAsset: false,
                                            verticalPadding: 8)
                                        .inputDec())),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              flex: 2,
                              fit: FlexFit.tight,
                              child: TextFormField(
                                  readOnly: true,
                                  initialValue: DateUtilsCustom.parsedate(
                                      flightData?.segment?.departureTime
                                              .toString() ??
                                          ""),
                                  // readOnly: true, // Make the text field read-only
                                  decoration: CustomInputDecoration(
                                          isLabelText: true,
                                          labelText: 'Time',
                                          isCalender: false,
                                          isPrefixIcon: false,
                                          isSvgPictiureAsset: false,
                                          verticalPadding: 8)
                                      .inputDec()),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Amount',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '₹ ${flightData?.segment?.price.toString() ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReUsableButton(
                  onTap: () {
                    ScaffoldMessenger.maybeOf(context)!.showSnackBar(SnackBar(
                        content: Text('Ticket Confirmed Sucessfully')));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlightBookingHome(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  buttonText: 'Confirm',
                ),
                SizedBox(
                  width: 20,
                ),
                OutlineReuableButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Cancel',
                ),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget _timeFlightColumn(BuildContext context, String time, String location) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            time ?? '',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          location ?? '',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
