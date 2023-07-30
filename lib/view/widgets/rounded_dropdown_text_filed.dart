import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flight_booking/custom_input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RoundedDropDownTextField extends StatelessWidget {
  final List<String> options;
  final String selectedOption;
  final String labelText;
  final String svgPicturePath;
  final ValueChanged<String?> onChanged;

  RoundedDropDownTextField({
    required this.options,
    required this.svgPicturePath,
    required this.labelText,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonFormField(
        // padding: EdgeInsets.symmetric(vertical: 16),
        decoration: CustomInputDecoration(
          isLabelText: true,
          labelText: labelText,
          isPrefixIcon: true,
          isSvgPictiureAsset: true,
          svgPicturePath: svgPicturePath,
        ).inputDec(),

        // InputDecoration(
        //   label: Text(labelText),
        //   prefixIcon: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SvgPicture.asset(
        //       svgPicturePath,
        //       height: 5,
        //       fit: BoxFit.fitHeight,
        //       width: 5,
        //     ),
        //   ), // Icon on the left side

        //   fillColor: Colors.white,
        //   border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //     borderSide: BorderSide(
        //         color: CustomColors.ColorGrey2), // Outline border color
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10.0),

        //     borderSide: BorderSide(
        //         color: Colors.grey, width: 2), // Outline border color
        //   ),
        //   focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10.0),
        //     borderSide: BorderSide(
        //         color: CustomColors.ColorGrey2,
        //         width: 2), // Outline border color
        //   ),
        //   contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        // ),

        //  child: DropdownButton<String>(
        value: selectedOption,
        onChanged: onChanged,
        items: options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          );
        }).toList(),
      ),
    );
  }
}
