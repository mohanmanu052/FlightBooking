import 'package:flight_booking/constants/city_constants.dart';
import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flight_booking/controller/flight_booking_controller.dart';
import 'package:flight_booking/custom_input_decoration.dart';
import 'package:flight_booking/reusable/reusable_button.dart';
import 'package:flight_booking/view/search_details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/flight_details_card.dart';
import 'widgets/rounded_dropdown_text_filed.dart';

class FlightBookingHome extends StatefulWidget {
  FlightBookingHome({super.key});

  @override
  State<FlightBookingHome> createState() => _FlightBookingHomeState();
}

class _FlightBookingHomeState extends State<FlightBookingHome> {
  String _selectedOptionFrom = 'Delhi';
  String _selectedOptionTo = 'Mumbai';
  FlightBookingController? controller;

  @override
  void initState() {
    controller = Provider.of<FlightBookingController>(context, listen: false);
    controller?.fetchFlightData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlightBookingController>(
        builder: (context, FlightBookingController controler, child) {
      return Scaffold(
          body: SafeArea(
              child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: RoundedDropDownTextField(
              svgPicturePath: 'assets/svgs/AirplaneTakeoff.svg',
              options: CityConstants.cityList,
              selectedOption: _selectedOptionFrom,
              labelText: 'From',
              onChanged: (newValue) {
                setState(() {
                  _selectedOptionFrom = newValue!;
                });
              },
            ),
          ),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: CustomColors.primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_upward_rounded,
                  size: 20,
                  color: CustomColors.ColorGrey2,
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  size: 20,
                  color: CustomColors.ColorGrey2,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: RoundedDropDownTextField(
              svgPicturePath: 'assets/svgs/AirplaneLanding.svg',
              options: CityConstants.cityList,
              selectedOption: _selectedOptionTo,
              labelText: 'To',
              onChanged: (newValue) {
                setState(() {
                  _selectedOptionTo = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: TextFormField(
                        controller: controller?.dateController,
                        readOnly: true, // Make the text field read-only
                        onTap: () {
                          controller?.selectDate(
                              context); // Show the date picker on tap
                        },
                        decoration: CustomInputDecoration(
                          isLabelText: true,
                          labelText: 'Select Date',
                          isCalender: true,
                          isPrefixIcon: false,
                          isSvgPictiureAsset: false,
                        ).inputDec())),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: TextFormField(
                      readOnly: true,
                      initialValue: "2",
                      // readOnly: true, // Make the text field read-only
                      decoration: CustomInputDecoration(
                        isLabelText: true,
                        labelText: 'Traveller',
                        isCalender: false,
                        isPrefixIcon: false,
                        isSvgPictiureAsset: false,
                      ).inputDec()),
                ),
              ],
            ),
          ),
          ReUsableButton(
            onTap: () {
              if (controller?.dateController.text != null &&
                  controller!.dateController.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchDetailsView(
                              flightData: controller!.flightData,
                              from: _selectedOptionFrom,
                              to: _selectedOptionTo,
                              date: controller!.dateController.text,
                            )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please Enter the Date')));
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          controller?.status == FlightStatus.LOADING
              ? Container(
                  height: 40,
                  width: 20,
                  child: CircularProgressIndicator(
                      color: CustomColors.primaryColor),
                )
              : controller?.status == FlightStatus.SUCCESS
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller?.flightData.length ?? 0,
                          itemBuilder: (context, position) {
                            return FlightDetailsCard(
                              flightData: controller?.flightData[position],
                            );
                          }),
                    )
                  : SizedBox()
        ]),
      )));
    });
  }
}
