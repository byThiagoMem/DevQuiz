
import 'package:devquiznlw/core/app_colors.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 80,
              width: 80,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                value: 0.8,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(child: Text("80%", style: AppTextStyles.heading,)),
        ],
      ),
    );
  }
}
