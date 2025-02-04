import 'package:epaisa_pos/src/utility/colors.dart';
import 'package:flutter/material.dart';

class ButtonQRScanner extends StatelessWidget {
  final double borderRadius;
  final Function onTap;
  ButtonQRScanner({
    this.borderRadius,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(borderRadius * 1.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AppColors.PrimaryWhite,
          boxShadow: [
            new BoxShadow(
                color: AppColors.DarkGray.withOpacity(0.8),
                offset: new Offset(0.6, 1.0),
                blurRadius: 1.0)
          ],
        ),
        child: Image.asset('assets/productsscreen/qrscanner.png'),
      ),
    );
  }
}
