import 'package:flight_booking/controller/flight_search_controller.dart';
import 'package:flight_booking/model/flight_model.dart';
import 'package:flight_booking/view/widgets/flight_details_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchDetailsView extends StatefulWidget {
  SearchDetailsView(
      {super.key, this.flightData, this.from, this.to, this.date});
  List<FlightModel>? flightData;
  String? from;
  String? to;
  String? date;

  @override
  State<SearchDetailsView> createState() => _SearchDetailsViewState();
}

class _SearchDetailsViewState extends State<SearchDetailsView> {
  @override
  void initState() {
    FlightSearchController controller =
        Provider.of<FlightSearchController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.serachUserFligthInputdata(widget.flightData ?? [],
          widget.from ?? '', widget.to ?? '', widget.date ?? '');
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlightSearchController>(
        builder: (context, FlightSearchController controller, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Search Flights'),
        ),
        body: SafeArea(
          child: Container(
            child: controller?.searchSate == SerachResultState.LOADING
                ? Center(child: CircularProgressIndicator())
                : controller?.searchSate == SerachResultState.SUCESS
                    ? Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  itemCount: controller?.searchResults.length,
                                  itemBuilder: (context, position) {
                                    return FlightDetailsCard(
                                      flightData:
                                          controller?.searchResults[position],
                                    );
                                  })),
                        ],
                      )
                    : Center(
                        child:
                            Text('No Flights Were Found To This Destination')),
          ),
        ),
      );
    });
  }
}
