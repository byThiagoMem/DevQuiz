
import 'package:devquiznlw/core/app_colors.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  bool isRight = false;
  bool isSeleted = false;

  AwnserWidget(this.title, this.isRight, this.isSeleted);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSeleted ? _selectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.fromBorderSide(BorderSide(
              color: isSeleted ? _selectedBorderCardRight : AppColors.border)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(
              title,
              style: isSeleted ? _selectedTextStyleRight : AppTextStyles.body,
            )),
            Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: isSeleted ? _selectedColorRight : AppColors.white,
                borderRadius: BorderRadius.circular(500.0),
                border:
                    Border.fromBorderSide(BorderSide(color: isSeleted ? _selectedBorderRight : AppColors.border)),
              ),
              child: isSeleted ? Icon(
                _selectedIconRight,
                size: 16,
                color:  AppColors.white,
              ) : null,
            )
          ],
        ),
      ),
    );
  }

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;
}
