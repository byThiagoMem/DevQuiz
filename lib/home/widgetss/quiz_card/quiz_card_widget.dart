
import 'package:devquiznlw/core/app_colors.dart';
import 'package:devquiznlw/core/app_images.dart';
import 'package:devquiznlw/core/app_text_styles.dart';
import 'package:devquiznlw/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.border),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(height: 16.0,),
              Text(
                "Gerenciamento de estado",
                style: AppTextStyles.heading15,
              ),
              SizedBox(height: 16.0,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "3 de 10",
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(value: 0.3,),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
