import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flight_booking/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class ReUsableButton extends StatelessWidget {
  ReUsableButton({super.key, this.buttonText, this.width, this.onTap});
  final String? buttonText;
  double? width;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: CustomColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minimumSize: Size(width ?? 130, 40), // Minimum width and height
          maximumSize: Size(width ?? 300, 40),
        ), // Maximum width and height
        onPressed: onTap,
        child: Text(
          buttonText ?? 'Serach',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ));
  }
}
