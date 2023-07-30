import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInputDecoration extends InputDecoration {
  bool? isLabelText = true;
  bool? isPrefixIcon = true;
  bool? isSvgPictiureAsset = true;
  double? verticalPadding;

  String? labelText;
  String? svgPicturePath;
  bool? isCalender = false;
  CustomInputDecoration(
      {this.isLabelText,
      this.isPrefixIcon,
      this.isSvgPictiureAsset,
      this.verticalPadding,
      this.labelText,
      this.isCalender,
      this.svgPicturePath});
  InputDecoration inputDec() {
    return InputDecoration(
      label: labelText != null ? Text(labelText ?? "") : null,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: svgPicturePath != null
            ? SvgPicture.asset(
                svgPicturePath ?? '',
                height: 5,
                fit: BoxFit.fitHeight,
                width: 5,
              )
            : isCalender ?? false
                ? const Icon(Icons.date_range)
                : null,
      ), // Icon on the left side

      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide:
            BorderSide(color: CustomColors.ColorGrey2), // Outline border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),

        borderSide:
            BorderSide(color: Colors.grey, width: 2), // Outline border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
            color: CustomColors.ColorGrey2, width: 2), // Outline border color
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: 16.0, vertical: verticalPadding ?? 16),
    );
  }
}
